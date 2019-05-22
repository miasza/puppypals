Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :dogs, only: [:index, :new, :create, :show, :destroy] do
    resources :dog_reviews, only: [:index, :new, :create, :edit, :update]
    resources :visits, only: :create
  end

  get "playdates", to: "dogs#playdates"

  resources :visits, only: :destroy


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

