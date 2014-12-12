Rails.application.routes.draw do

  #pages contoller
  root 'pages#index'
  get 'index' => 'pages#index'

  #home contoller
  get 'home' => 'home#index'

  #notes
  resources :notes

  #categories
  resources :categories

  #categories
  resources :tasks

  #devise (auth)
  devise_for :users, controllers: { registrations: 'registrations',
  									sessions: 'sessions',
  									passwords: 'passwords' }
end
