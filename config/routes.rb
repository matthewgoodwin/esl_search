Rails.application.routes.draw do
  # get 'job_posts/index'
  # get 'job_posts/show'
  # get 'job_posts/new'
  # get 'job_posts/create'
  # get 'job_posts/edit'
  # get 'job_posts/update'
  # get 'job_posts/destroy'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    get 'clients/index'

    get 'clients/show'

    get 'clients/destroy'

    devise_for :users
    resources :users, only:[:index, :show, :edit, :update, :destroy], shallow: true do
      member do # member => User id in URL
        # ^ creates routes outside the seven routes created by default
        get 'user_consultations', to: 'users#user_consultations'
        get 'user_appointments', to: 'users#user_appointments'
        get 'user_messages', to: 'users#user_messages'
        get 'user_products', to: 'users#user_products'
        get 'user_clients', to: 'users#user_clients'
        get 'user_reviews', to: 'users#user_reviews'
        get 'user_privatemessages', to: 'users#user_privatemessages'
      end
      collection do # collection => no id in URL
        get 'search'
      end
      resources :privatemessages, only: [:show, :create, :edit, :update, :destroy]
    end
    resources :consultations, shallow: true do
      collection do
        # get 'hourly', to: 'consultations#hourly'

        get :langs_admissions
        get :lang_admission

        get :langs_tutors
        get :lang_tutor

        get :langs_test_preps
        get :lang_test_prep

        get :langs_top_rated
        get :lang_top_rated

        get :langs_locs
        get :lang_locs
        get :lang_loc

        get :langs_types
        get :lang_types
        get :lang_type

        get :langs_periods
        get :lang_periods
        get :lang_period

        get :langs_onlines
        get :lang_online

        get :langs_hourlies
        get :lang_hourly

        get :langs_flats
        get :lang_flat

        get :langs_free_services
        get :lang_free_service

        get :langs_edus
        get :lang_edu

        get :langs_tests
        get :lang_test

        get :langs_acts
        get :lang_act
        # ^ this is the new way
        get 'locations', to: 'consultations#locations'
        get 'location', to: 'consultations#location'
      end
      resources :lessons, shallow: true do
          get 'enrollment', to: 'lessons#enrollment'
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
  end # end of locales scope method
end
