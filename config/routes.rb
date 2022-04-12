Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/auth/login", to: "auth#login"
      post "/auth/register", to: "auth#register"

      resources :bookmarks, only: :destroy
      resources :buddies, only: :destroy
      resources :collections, except: :destroy do
        resources :bookmarks, only: :create, module: "collection"
        resources :collection_items, except: [:show, :update], module: "collection", path: "collection-items"
        resources :upvotes, only: [:index, :create], module: "collection"
        resources :visitors, only: :index, module: "collection"
      end
      resources :comments, only: [:show, :update] do
        resources :bookmarks, only: :create, module: "comment"
        resources :collections, only: :index, module: "comment"
        resources :downvotes, only: :create, module: "comment"
        resources :replies, only: [:index, :create], module: "comment"
        resources :upvotes, only: [:index, :create], module: "comment"
      end
      resources :communities, except: :destroy do
        resources :collections, only: :index, module: "community"
        resources :community_members, only: [:index, :create], module: "community", path: "community-members"
        resources :posts, only: [:index, :create], module: "community"
        resources :visitors, only: :index, module: "community"
      end
      resources :community_members, only: :destroy, path: "community-members"
      resources :posts, except: [:create, :destroy] do
        resources :bookmarks, only: :create, module: "post"
        resources :collections, only: :index, module: "post"
        resources :comments, only: [:index, :create], module: "post"
        resources :upvotes, only: [:index, :create], module: "post"
        resources :visitors, only: :index, module: "post"
      end
      resources :replies, only: [:show, :update] do
        resources :bookmarks, only: :create, module: "reply"
        resources :collections, only: :index, module: "reply"
        resources :upvotes, only: [:index, :create], module: "reply"
      end
      resources :upvotes, only: :destroy
      resources :users, except: [:create, :destroy] do
        resources :bookmarks, only: :index, module: "user"
        resources :buddies, only: [:index, :create], module: "user"
        resources :collections, only: :index, module: "user"
        resources :comments, only: :index, module: "user"
        resources :communities, only: :index, module: "user"
        resources :posts, only: :index, module: "user"
        resources :replies, only: :index, module: "user"
        resources :upvotes, only: :index, module: "user"
        resources :visitors, only: :index, module: "user"
      end
    end
  end
end
