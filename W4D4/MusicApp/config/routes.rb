Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:create, :new, :show]
  resources :bands
  resources :albums, only: [:new, :create, :edit, :show, :destroy, :update]
  resources :track, only: [:new, :create, :edit, :show, :destroy, :update]
end
