class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_recipe, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @recipes = Recipe.includes(:user).order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
    @ingredient = @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    return if @recipe.user_id == current_user.id

    redirect_to root_path
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_title, :recipe_procedure, :recipe_volume, :recipe_material, :recipe_quantity,
                                   :cooking_time, :tool_id, :category_id, {images: []}, 
                                   ingredients_attributes:[:id, :recipe_id, :thing_id, :amount, :_destroy])
                                   .merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def move_to_index
    return if @recipe.user_id == current_user.id

    redirect_to root_path
  end
end
