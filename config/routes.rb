Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :dogs do
    resources :dog_reviews, only: [:index, :new, :create, :edit, :update]
    resources :visits, only: :create
  end

  get "playdates", to: "dogs#playdates"

  get "mypals", to: "dogs#mypals"

  resources :visits, only: [:destroy, :accept]

  resources :visits do
    get "accept", to: "visits#accept"
    patch "accept", to: "visits#accept"
    put "accept", to: "visits#accept"
    get "decline", to: "visits#decline"
    patch "decline", to: "visits#decline"
    put "decline", to: "visits#decline"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

