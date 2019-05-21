Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :dogs, only: [:index, :new, :create, :show, :destroy] do
    resources :visits, only: [:destroy, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

