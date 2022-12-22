Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index'
  root to: "recipes#index"
end
