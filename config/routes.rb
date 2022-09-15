Rails.application.routes.draw do
  resources :user_resource_policies
  resources :resource_policies
  resources :budget_users
  resources :budget_spaces
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "budget_spaces#index"
end
