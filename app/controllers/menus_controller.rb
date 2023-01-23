class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:index, :new, :create, :edit, :update]

  def index
    # current_user_idのものだけ表示する
    @recipes = Recipe.includes(:user)
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path
    else
      render :new
    end
  end

  def edit    
  end

  def update
  end
  
  def destroy
  end

  private

  def menu_params
    params.require(:menu).permit(:recipe_id).merge(user_id: current_user.id)
  end

  def set_menu
    @menu_main = Recipe.where(category_menu_id: 1)
    @menu_sub = Recipe.where(category_menu_id: 2)
    @menu_soup = Recipe.where(category_menu_id: 3)
  end
end
