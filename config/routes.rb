Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/auth/login", to: "auth#login"
      post "/auth/register", to: "auth#register"

      resources :buddies, only: :destroy
      resources :comments, only: :update do
        resources :likes, only: :create, module: "comment"
        resources :replies, only: :create
      end
      resources :communities, only: [:create, :update] do
        resources :members, only: :create
        resources :posts, only: :create
      end
      resources :likes, only: :destroy
      resources :members, only: :destroy
      resources :posts, only: :update do
        resources :comments, only: :create
        resources :likes, only: :create, module: "post"
      end
      resources :replies, only: :update do
        resources :likes, only: :create, module: "reply"
      end
      resources :users, only: :update do
        resources :buddies, only: :create
      end
    end
  end
end
