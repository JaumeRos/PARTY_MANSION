Rails.application.routes.draw do
  get 'mansions/new'
  get 'mansions/create'
  devise_for :users
  root to: 'pages#home'
  resources :mansions, only: [:index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end