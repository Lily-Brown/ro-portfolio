Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :projects do
    resources :images
  end

  root to: 'projects#index'

end
