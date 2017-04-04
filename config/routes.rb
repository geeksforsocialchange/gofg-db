Rails.application.routes.draw do

  # People & subtypes
  resources :people
  resources :participants
  resources :mentors
  resources :coaches

  # Organisations
  resources :organisations
end
