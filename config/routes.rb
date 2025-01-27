Rails.application.routes.draw do
  # Inne trasy...

  # Trasa główna
  root "movies#index"


  # Trasa dla filmów
  resources :movies do
    # Trasa dla recenzji filmów (tylko akcja create)
    resources :reviews, only: [:create]
  end

  # Health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check
end
