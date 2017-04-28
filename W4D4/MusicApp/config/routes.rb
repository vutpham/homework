Rails.application.routes.draw do



  resources :users, only: [:new, :create, :show] do
    resources :notes, only: [:create, :destroy]
  end
  resource :sessions, only: [:new, :create, :destroy]
  resources :bands do
    resources :albums, only: [:new]
  end
  resources :albums, except: [:new, :index] do
    resources :tracks, only: [:new]
  end
  resources :tracks, except: [:new, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
