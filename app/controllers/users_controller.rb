class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @recipe = current_user.recipes
  end
end