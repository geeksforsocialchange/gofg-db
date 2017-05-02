Rails.application.routes.draw do

  resources :activity_coaches
  resources :attendances
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
  resources :events
  resources :fieldworks
  resources :meetings
  resources :activities

  # Home page
  root 'home#index'
end
