Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'items#index'

  resources :lists, only: [:show] do
    member do
      post :toggleItem
    end
    resources :items, except: [:show]
    resources :categories, except: [:show]
  end
end
