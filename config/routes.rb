Rails.application.routes.draw do
  # Health check (API style)
  get "/health", to: proc {
    [200, { "Content-Type" => "application/json" }, [{ status: "ok" }.to_json]]
  }

  # Authentication
  post "/login", to: "auth#login"

  # Social features
  resources :posts, only: [:index, :create]
  resources :comments, only: [:create]
end
