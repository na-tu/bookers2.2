Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new,:create,:index,:show,:edit,:update,:destroy]
  #get 'books/new'
  #get 'books/create'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  #get 'books/update'
  #get 'books/destroy'
  #get 'homes/top'
  resources :users, only: [:index,:show, :edit, :update]
  root to: 'homes#top'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
