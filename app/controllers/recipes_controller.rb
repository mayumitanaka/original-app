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
    @ingredients = @recipe.ingredients
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

  def destroy
    recipe = Recipe.find(params[:id])
    return unless recipe.user_id == current_user.id

    recipe.destroy
    redirect_to root_path
  end

  def search
    if params[:q]&.dig(:recipe_title)
      squished_keywords = params[:q][:recipe_title].squish
      params[:q][:recipe_title_cont_any] = squished_keywords.split(" ")
    end
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result.order('created_at DESC')
  end


  private

  def recipe_params
    params.require(:recipe).permit(:recipe_title, :recipe_procedure, :recipe_volume,
                                   :cooking_time, :tool_id, :category_id, :image,
                                   ingredients_attributes: [:id, :recipe_id, :ing, :quantity, :_destroy])
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
