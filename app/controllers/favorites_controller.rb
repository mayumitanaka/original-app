class FavoritesController < ApplicationController
  before_action :set_recipe

  def create
    @recipe_favorite = Favorite.new(user_id: current_user.id, recipe_id: @recipe.id)
    @recipe_favorite.save
    redirect_to recipe_path(@recipe.id)
  end

  def destroy
    @recipe_favorite = Favorite.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    @recipe_favorite.destroy
    redirect_to recipe_path(@recipe.id)
  end


  private
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end
end