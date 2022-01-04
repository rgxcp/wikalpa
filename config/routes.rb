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
        resources :members, only: :create
        resources :posts, only: :create
      end
      resources :members, only: :destroy
      resources :posts, only: :update do
        resources :comments, only: :create
      end
      resources :replies, only: :update
      resources :users, only: :update do
        delete "/unfollow", to: "buddies#unfollow"

        resources :buddies, only: :create
      end
    end
  end
end
