Rails.application.routes.draw do
  root 'academies#index'
  devise_for :users

  resources :first_time_videos, only: [:index]

  resources :academies, only: [:index, :show, :new, :create, :update] do
    resources :tournaments, only: [:new, :create]
  end

  resources :tournaments, only: [:show] do
    resources :videos, only: [:new, :create]
    resources :brackets, only: [:create, :update]
  end

  namespace :api do
    namespace :v1 do
      resources :academies, only: [:index, :show, :new, :create, :update] do
        resources :tournaments, only: [:new, :create]
      end
      resources :tournaments, only: [:show, :update, :destroy] do
        resources :brackets, only: [:create, :update]
        resources :tourney_rosters, only: [:create, :update, :destroy]
        resources :advance_brackets, only: [:create]
        resources :final_rounds, only: [:create]
        resources :videos, only: [:new, :create, :destroy]
      end
      resources :rounds, only: [:update]
    end
  end
end
