Rails.application.routes.draw do
  
  resources :projects do
    resources :images
  end

  root to: 'projects#index'

end
