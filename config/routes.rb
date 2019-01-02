Rails.application.routes.draw do
  root 'seasons#show_current'

  resources :divisions, only: [:index, :show]
  get '/divisions/:id/week/:week', to: 'divisions#week', as: :division_week

  resources :faq, only: [:index]
  resources :matches
  resources :seasons, only: [:index, :show]
  resources :teams, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
