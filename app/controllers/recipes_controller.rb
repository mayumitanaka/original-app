class RecipesController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @recipes = Recipe.includes(:user).order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_title, :recipe_procedure, :recipe_volume, :recipe_material, :recipe_quantity,
                                   :cooking_time, :tool_id, :category_id, :image).merge(user_id: current_user.id)
  end
end
