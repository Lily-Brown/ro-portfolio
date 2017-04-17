Rails.application.routes.draw do
  
  devise_for :users
  resources :projects do
    resources :images
  end

  root to: 'projects#index'

end
