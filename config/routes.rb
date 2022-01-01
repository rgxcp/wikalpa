Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/auth/login", to: "auth#login"
      post "/auth/register", to: "auth#register"

      resources :comments, only: :update do
        resources :replies, only: :create
      end
      resources :communities, only: [:create, :update] do
        post "/join", to: "members#join"
        delete "/leave", to: "members#leave"

        resources :posts, only: :create
      end
      resources :posts, only: :update do
        resources :comments, only: :create
      end
      resources :replies, only: :update
      resources :users, only: :update do
        post "/follow", to: "buddies#follow"
        delete "/unfollow", to: "buddies#unfollow"
      end
    end
  end
end
