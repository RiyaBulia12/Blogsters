Rails.application.routes.draw do
  root 'users#index'
  get '/users', to: 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
