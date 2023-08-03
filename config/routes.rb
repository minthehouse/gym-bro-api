#---
# Excerpted from "Agile Web Development with Rails 7",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/rails7 for more book information.
#---
Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    sessions: 'sessions'
  }

  resources :users do
    resources :workouts, only: [:index, :show, :update, :destroy] do
      member do
        get :previous_workout, :next_workout
      end
    end

    resources :diets, only: [:index, :show, :update, :destroy] do
      member do
        get 'find_by_date/:date', action: 'find_by_date', as: :find_by_date
        get 'find_the_latest_diet', action: 'find_the_latest_diet', as: :find_the_latest_diet
      end
    end
  end

  post '/workout', to: 'workouts#create'
  post '/diet', to: 'diets#create'
  put '/diets/:id', to: 'diets#update'

  resources :exercises, only: [:index, :show, :create, :update, :destroy]
  resources :exercise_types, only: [:index, :show, :destroy] do
    collection do
      get 'search'
    end
  end

  get '/foods/search', to: 'foods#search'

  # Defines the root path route ("/")
  # root "articles#index"
end
