Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'homes#top'
  get '/users/my_page' => 'users#mypage'
  get '/users/unsubscribe' => 'users#unsubscribe'
  get '/users/thanks' => 'users#thanks'
  get '/users/search' => 'users#search'
  resources :users, only: [:edit, :update, :destroy, :show] do
    resource :relationships, only: [:create, :update, :destroy]
    get 'followings' => 'relationships#followings'
    get 'followers' => 'relationships#followers'
    delete 'decline' => 'relationships#decline'
  end
  resources :categories, only: [:index, :show]
  resources :items
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm'
  post 'contacts/back', to: 'contacts#back'
  get 'done', to: 'contacts#done'


end
