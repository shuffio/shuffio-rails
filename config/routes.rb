Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }

  root 'seasons#show_current'

  resources :divisions, only: [:index, :show]
  get '/divisions/:id/week/:week', to: 'divisions#week', as: :division_week
  post '/divisions/:id/week/:week/report', to: 'divisions#week_report', as: :division_week_report

  resources :faq, only: [:index]
  resources :matches
  resources :privacy, only: [:index]
  resources :seasons, only: [:index, :show]
  resources :teams, only: [:index, :show]
  get '/playoffs', to: 'seasons#playoffs'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
