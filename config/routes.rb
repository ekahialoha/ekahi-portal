Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }

  get 'public', to: 'static_contents#public'
  get 'private', to: 'static_contents#private'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
