Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'sessions#welcome'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'

  resources :users, only: [:create]

  resources :lists, only: [:show] do
    member do
      post :toggleItem
      post :clearAll
    end
    resources :items, except: [:show]
    resources :categories, except: [:show]
  end
end
