Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/auth/login", to: "auth#login"
      post "/auth/register", to: "auth#register"

      resources :buddies, only: :destroy
      resources :comments, only: [:show, :update] do
        resources :bookmarks, only: :create, module: "comment"
        resources :likes, only: [:index, :create], module: "comment"
        resources :replies, only: [:index, :create], module: "comment"
      end
      resources :communities, except: :destroy do
        resources :members, only: [:index, :create], module: "community"
        resources :posts, only: [:index, :create], module: "community"
        resources :visitors, only: :index, module: "community"
      end
      resources :likes, only: :destroy
      resources :members, only: :destroy
      resources :posts, only: [:index, :show, :update] do
        resources :bookmarks, only: :create, module: "post"
        resources :comments, only: [:index, :create], module: "post"
        resources :likes, only: [:index, :create], module: "post"
        resources :visitors, only: :index, module: "post"
      end
      resources :replies, only: [:show, :update] do
        resources :bookmarks, only: :create, module: "reply"
        resources :likes, only: [:index, :create], module: "reply"
      end
      resources :users, only: [:index, :show, :update] do
        resources :bookmarks, only: :index, module: "user"
        resources :buddies, only: [:index, :create], module: "user"
        resources :comments, only: :index, module: "user"
        resources :communities, only: :index, module: "user"
        resources :likes, only: :index, module: "user"
        resources :posts, only: :index, module: "user"
        resources :replies, only: :index, module: "user"
        resources :visitors, only: :index, module: "user"
      end
    end
  end
end
