Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/auth/login", to: "auth#login"
      post "/auth/register", to: "auth#register"

      namespace :admin do
        resources :feature_toggles, except: :destroy, path: "feature-toggles"
      end

      resources :bookmarks, only: :destroy
      resources :buddies, only: :destroy
      resources :collections, except: :destroy do
        scope module: "collection" do
          resources :bookmarks, only: :create
          resources :collection_items, except: [:show, :update], path: "collection-items"
          resources :downvotes, only: :create
          resources :upvotes, only: [:index, :create]
          resources :visitors, only: :index
        end
      end
      resources :comments, only: [:show, :update] do
        scope module: "comment" do
          resources :bookmarks, only: :create
          resources :collections, only: :index
          resources :downvotes, only: :create
          resources :replies, only: [:index, :create]
          resources :upvotes, only: [:index, :create]
        end
      end
      resources :communities, except: :destroy do
        scope module: "community" do
          resources :collections, only: :index
          resources :community_members, only: [:index, :create], path: "community-members"
          resources :posts, only: [:index, :create]
          resources :visitors, only: :index
        end
      end
      resources :community_members, only: :destroy, path: "community-members"
      resources :downvotes, only: :destroy
      resources :posts, except: [:create, :destroy] do
        scope module: "post" do
          resources :bookmarks, only: :create
          resources :collections, only: :index
          resources :comments, only: [:index, :create]
          resources :downvotes, only: :create
          resources :upvotes, only: [:index, :create]
          resources :visitors, only: :index
        end
      end
      resources :replies, only: [:show, :update] do
        scope module: "reply" do
          resources :bookmarks, only: :create
          resources :collections, only: :index
          resources :downvotes, only: :create
          resources :upvotes, only: [:index, :create]
        end
      end
      resources :upvotes, only: :destroy
      resources :users, except: [:create, :destroy] do
        scope module: "user" do
          get "/visitations", to: "visitations#index"

          resources :bookmarks, only: :index
          resources :buddies, only: [:index, :create]
          resources :collections, only: :index
          resources :comments, only: :index
          resources :communities, only: :index
          resources :downvotes, only: :index
          resources :posts, only: :index
          resources :replies, only: :index
          resources :upvotes, only: :index
          resources :username_histories, only: :index, path: "username-histories"
          resources :visitors, only: :index
        end
      end
    end
  end
end
