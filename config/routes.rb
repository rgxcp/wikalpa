Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/auth/login", to: "auth#login"
      post "/auth/register", to: "auth#register"

      resources :communities, only: [:create, :update] do
        post "/join", to: "members#join"
        delete "/leave", to: "members#leave"

        resources :posts, only: [:create, :update]
      end
      resources :users, only: :update
    end
  end
end
