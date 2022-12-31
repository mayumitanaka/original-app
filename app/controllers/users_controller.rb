class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @recipes = current_user.recipes
    @favorites = current_user.favorites
  end
end