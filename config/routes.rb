Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'homes#top'
  get '/users/my_page' => 'users#mypage'
  get '/users/unsubscribe' => 'users#unsubscribe'
  patch '/users/withdraw' => 'users#withdraw'
  get '/users/thanks' => 'users#thanks'
  get '/users/search' => 'users#search'
  resources :users, only: [:edit, :update, :show]
  resources :categories, only: [:index]
  resources :items
  resource :relationships, only: [:create, :destroy]
  get '/relationships/followings' => 'relationships#followings'
  get '/relationships/followers' => 'relationships#followers'

end
