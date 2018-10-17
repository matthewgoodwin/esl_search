Rails.application.routes.draw do

  devise_for :users
  resources :users, only:[:index, :show], shallow: true do
    member do
      # ^ creates routes outside the seven routes created by default
      get 'user_consultations', to: 'users#user_consultations'
      get 'user_appointments', to: 'users#user_appointments'
      get 'user_messages', to: 'users#user_messages'
      get 'user_products', to: 'users#user_products'
      get 'user_clients', to: 'users#user_clients'
      get 'user_reviews', to: 'users#user_reviews'
      get 'user_privatemessages', to: 'users#user_privatemessages'
    end
    collection do
      get 'search'
    end
    resources :privatemessages, only: [:show, :create, :edit, :update, :destroy]
  end
  resources :consultations, shallow: true do
    resources :lessons, shallow: true do
        get 'enrollment', to: 'lesson#enrollment'
      resources :appointments
    end
    resources :reviews
    resources :appointments
    resources :messages
  end # end of shallow nest.. shallow nest allows only nesting for required resouces
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'dashboard', to: 'pages#dashboard'
  get 'search', to: 'pages#search'
  get 'users', to: 'pages#user'
  # get 'user_consultations', to: 'users#consultations'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
