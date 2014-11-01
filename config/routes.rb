Rails.application.routes.draw do
  resources :lists

  devise_for :users
  get 'welcome/index'
  
  root to: 'welcome#index'
end
