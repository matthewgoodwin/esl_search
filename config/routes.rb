Rails.application.routes.draw do
  # get 'lessons/index'

  # get 'lessons/show'

  # get 'lessons/create'

  # get 'lessons/update'

  # get 'lessons/edit'

  # get 'lessons/destroy'

  # get 'privatemessages/index'

  # get 'privatemessages/show'

  # get 'privatemessages/new'

  # get 'privatemessages/create'

  # get 'privatemessages/edit'

  # get 'privatemessages/update'

  # get 'privatemessages/destroy'

  # get 'users/index'

  # get 'users/show'

  # get 'users/search'

  # get 'review/show'

  # get 'review/new'

  # get 'review/create'

  # get 'review/edit'

  # get 'review/destroy'

  # get 'messages/show'

  # get 'messages/new'

  # get 'messages/create'

  # get 'messages/edit'

  # get 'messages/update'

  # get 'messages/destroy'

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
    end
    collection do
      get 'search'
    end
    resources :privatemessages
  end
  resources :consultations, shallow: true do
    resources :lessons, shallow: true do
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
