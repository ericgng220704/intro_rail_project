Rails.application.routes.draw do
  resources :plants

  root 'static_pages#home'
end
