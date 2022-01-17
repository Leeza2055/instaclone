Rails.application.routes.draw do
  resources :follows
  # resources :comments
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'home/index'
  # root 'home#index'
  root 'posts#index'
  resources :posts
  resources :posts do
    resources :comments
    resources :upvotes, only: :create
    resources :downvotes, only: :create
  end
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
