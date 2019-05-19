Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  get 'users/top'
  get 'users/edit'
  put 'users/destroy'
  get 'users/delete'
  patch 'users/update'
  get 'users/edit_complete'
  get 'users/complete'

  get '/dietter' => 'home#top'
  root 'users#top'
  resources :users, :except => [:new, :create]
  resources :contacts, only: [:new, :create, :update, :index, :show]

resources :weights, only: [:index]
  get '/weights/predict' => 'weights#new'
  post '/weights/predict' => 'weights#new'

  get '/weights/calc' => 'weights#calc'
  post '/weights/calc' => 'weights#calc'

end
