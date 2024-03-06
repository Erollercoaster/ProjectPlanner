Rails.application.routes.draw do
  # Devise routes
  devise_for :users

  root 'dashboard#index'

  resources :categories do 
    resources :tasks
  end
  
end

