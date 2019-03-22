Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }

  root 'seasons#show_current'

  resources :admin, only: [:index]

  namespace :admin do
    resources 'teams', only: [:index]
  end

  resources :divisions, only: [:index, :show]
  get '/divisions/:id/playoff', to: 'divisions#show_playoff', as: :division_playoff
  get '/divisions/:id/week/:week', to: 'divisions#week', as: :division_week
  post '/divisions/:id/week/:week/report', to: 'divisions#week_report', as: :division_week_report

  resources :faq, only: [:index]
  resources :matches
  resources :privacy, only: [:index]
  resources :seasons, only: [:index, :show]
  resources :teams, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
