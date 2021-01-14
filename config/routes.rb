Rails.application.routes.draw do
  resources :authors, only: [:new, :create]
  get 'signup', to: 'authors#new', as: 'signup'
  get 'login', to: 'sessions#create', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'profile', to: 'authors#edit', as: 'profile'
  root "posts#index", as: "home"
  resources :posts do
    resources :comments do
      resources :likes
      post 'dislikes' => 'like#dislike'
    end
    get 'search', on: :collection
  end
  resources :authors
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
