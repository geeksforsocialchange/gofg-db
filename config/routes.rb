Rails.application.routes.draw do

  resources :passwords, controller: "users/passwords", only: [:create, :new]
  resource :session, controller: "users/sessions", only: [:create]

  resources :users do
    resource :password, controller: "users/passwords", only: [:create, :edit, :update]
    member do
      get :setup
      patch :complete
    end
  end

  get "/sign_in" => "users/sessions#new", as: "sign_in"
  delete "/sign_out" => "users/sessions#destroy", as: "sign_out"
  #get "/sign_up" => "clearance/users#new", as: "sign_up"
  get '/authentication/step-two', to: 'user_mfa_session#new'
  post '/user_mfa_session', to: 'user_mfa_session#create'

  resources :activity_coaches
  #resources :attendances
  resources :memberships
  # People
  resources :people
  resources :participants
  resources :mentors
  resources :coaches

  resources :peers

  # Organisations
  resources :organisations

  # Events
  resources :events do
    resources :attendances
  end
  resources :fieldworks
  resources :meetings
  resources :activities

  resources :documents do
    resources :uploads do
      get :download, on: :member
    end
  end
  resources :interviews
  resources :galleries
  resources  :outputs

  # Home page
  root 'home#index'
end
