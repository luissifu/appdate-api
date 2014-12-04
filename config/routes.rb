Rails.application.routes.draw do
  #pages contoller
  root 'pages#index'
  get 'index' => 'pages#index'

  #home contoller
  get 'home' => 'home#index'

  #notes
  resources :notes

  #devise (auth)
  devise_for :users
end
