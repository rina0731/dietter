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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dietter' => 'home#top'
  root 'users#top'
  resources :users, :except => [:new, :create]
  resources :contacts, only: [:new, :create, :update, :index, :show]
  
  get '/weights/predict' => 'weights#new'
  post '/weights/predict' => 'weights#new'
end
