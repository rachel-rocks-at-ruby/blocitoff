Rails.application.routes.draw do
  resources :lists do 
    resources :todos
  end

  devise_for :users
    resources :users, only: [:update]

  get 'welcome/index'
  
  root to: 'welcome#index'
end
