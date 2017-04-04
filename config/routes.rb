Rails.application.routes.draw do
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
end
