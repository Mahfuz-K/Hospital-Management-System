# frozen_string_literal: true

# this is a routes file
# rubocop:disable Metrics/BlockLength

Rails.application.routes.draw do
  resources :payment_types
  resources :bed_types
  resources :patients do
    collection do
      get :search
    end
    resources :prescriptions
    resources :invoices do
      member do
        get :generate_invoice
        get :email_invoice
      end
    end
  end
  root to: 'sessions#new'
  resources :roles

  resources :users do
    collection do
      get :locked
    end
    member do
      post :unlock
    end
  end

  get '/user/:id/:token', to: 'users#confirm', as: 'confirm_user'

  post '/send_reset_password_instructions', to: 'passwords#send_reset_password_instructions',
                                            as: 'send_reset_password_instructions'
  get '/reset_password/:token', to: 'passwords#reset_password', as: 'reset_password'
  patch '/reset_password/:token', to: 'passwords#update_password'

  get '/forgot_password', to: 'passwords#forgot_password'

  get '/unlock_account/:unlock_token', to: 'users#unlock_account', as: 'unlock_account'

  get '/login', to: 'sessions#new'
  get '/homepage', to: 'welcome#homepage'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# rubocop:enable Metrics/BlockLength
