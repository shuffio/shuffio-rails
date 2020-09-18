Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'bracket#index'

  resources :admin, only: [:index]

  namespace :admin do
    resources 'canam' do
      delete :tournament_round_matches
      post :generate_tournament_round_matches
      get :assign_courts # need a param here
      post :process_courts
      collection do
        post :import
        get :player
        get :summary
      end
    end
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
  get 'bracket/current', to: 'bracket#current', as: :current_bracket
  resources :bracket
  resources :games, only: [:update]
  resources :isa, only: [:index]
  resources :live, only: [:index, :lower_third, :four_frame_summary, :four_game, :full_game, :two_game, :summary]
  get 'live/lower_third', to: 'live#lower_third', as: :lower_third
  get 'live/four_frame_summary', to: 'live#four_frame_summary', as: :four_frame_summary
  get 'live/full_game', to: 'live#full_game', as: :full_game
  get 'live/summary', to: 'live#summary', as: :summary
  get 'live/four_game', to: 'live#four_game', as: :four_game
  get 'live/two_game', to: 'live#two_game', as: :two_game
  resources :live_events, only: [:update]
  resources :matches
  resources :privacy, only: [:index]
  resources :royal_palms_calendar, only: [:index]
  post 'rpc_events', to: 'royal_palms_calendar#index', as: :rpc_events
  resources :seasons, only: [:index, :show]
  get '/seasons/:id/report', to: 'seasons#report', as: :season_report
  resources :teams, only: [:index, :show]
  resources :tournament_rounds, only: [:index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
