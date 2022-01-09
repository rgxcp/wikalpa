Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/auth/login", to: "auth#login"
      post "/auth/register", to: "auth#register"

      resources :buddies, only: :destroy
      resources :comments, only: [:show, :update] do
        resources :likes, only: :create, module: "comment"
        resources :replies, only: :create, module: "comment"
      end
      resources :communities, except: :destroy do
        resources :members, only: [:index, :create], module: "community"
        resources :posts, only: :create, module: "community"
      end
      resources :likes, only: :destroy
      resources :members, only: :destroy
      resources :posts, only: [:index, :show, :update] do
        resources :comments, only: :create, module: "post"
        resources :likes, only: :create, module: "post"
      end
      resources :replies, only: [:show, :update] do
        resources :likes, only: :create, module: "reply"
      end
      resources :users, only: [:index, :show, :update] do
        resources :buddies, only: [:index, :create], module: "user"
      end
    end
  end
end
