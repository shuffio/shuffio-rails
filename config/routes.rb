Rails.application.routes.draw do
  resources :divisions
  resources :matches
  resources :teams, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
