Rails.application.routes.draw do
  get 'characters/index'

  resources :characters do
    resources :skills
  end
  
  root 'characters#index'
end
