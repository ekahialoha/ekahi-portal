Rails.application.routes.draw do

  devise_for :users, skip: :all
  devise_scope :user do
    scope '/users' do
      post '/sign_in' => 'sessions#create', as: 'user_session'
      delete '/sign_out' => 'sessions#destroy', as: 'destroy_user_session'

      patch '/password' => 'devise/passowrds#update', as: 'user_password'
      put '/password' => 'devise/passwords#update'
      post '/passord' => 'devise/passwords#create'

      patch '/' => 'registrations#update', as: 'user_registration'
      put '/' => 'registrations#update'
      post '/' => 'registrations#create'
      delete '/' => 'registrations#destory'
    end
  end

  # TEMP to test authentication
  get 'public', to: 'static_contents#public'
  get 'private', to: 'static_contents#private'

  resources :feeds
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
