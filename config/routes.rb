Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }

  root 'seasons#show_current'

  resources :admin, only: [:index]

  namespace :admin do
    resources 'seasons', only: [:show]
    resources 'teams' do
      collection do
        post :import
        post :import_selection
      end
    end
  end

  resources :divisions, only: [:index, :show]
  get '/divisions/:id/playoff', to: 'divisions#show_playoff', as: :division_playoff
  get '/divisions/:id/week/:week', to: 'divisions#week', as: :division_week
  post '/divisions/:id/week/:week/report', to: 'divisions#week_report', as: :division_week_report

  resources :faq, only: [:index]
  resources :games, only: [:update]
  resources :isa, only: [:index]
  resources :live, only: [:index, :lower_third]
  get 'live/lower_third', to: 'live#lower_third', as: :lower_third
  resources :live_events, only: [:update]
  resources :matches
  resources :privacy, only: [:index]
  resources :seasons, only: [:index, :show]
  get '/seasons/:id/report', to: 'seasons#report', as: :season_report
  resources :teams, only: [:index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
