Rails.application.routes.draw do
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
  resources :users, only:[:index, :show, :search]
  resources :consultations, shallow: true do
    resources :reviews
    resources :appointments
  end # end of shallow nest.. shallow nest allows only nesting for required resouces
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'dashboard', to: 'pages#dashboard'
  get 'search', to: 'pages#search'
  get 'users', to: 'pages#user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
