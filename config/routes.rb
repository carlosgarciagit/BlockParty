Rails.application.routes.draw do

  root to: 'application#home'

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations'}, path: 'registration'


  authenticate :user do
    resource :users, only: [:edit, :update]
  end


  #TODO authenticate other event routes
  resources :events, :photos, :about, :contact
  post :register_for_event, to: "events#register"


end
