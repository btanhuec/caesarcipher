Rails.application.routes.draw do
  resources :ciphers
  root 'ciphers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
