Rails.application.routes.draw do

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  #get "/sign_up" => "clearance/users#new", as: "sign_up"
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
