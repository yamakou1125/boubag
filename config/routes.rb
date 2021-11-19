Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'users/my_page' => 'users#mypage'
  get '/users/unsubscribe' => 'users#unsubscribe'
  patch '/users/withdraw' => 'users#withdraw'
  get '/users/thanks' => 'users#thanks'
  get '/users/search' => 'users#search'
  resources :users, only: [:edit, :update, :show]


end
