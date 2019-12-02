Rails.application.routes.draw do
  get 'characters/index'
  root 'characters#index'
end
