class Api::V1::Collection::BookmarksController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    collection = Collection.find(params[:collection_id])

    bookmark = collection.bookmarks.build(user: @auth_user)

    if bookmark.save
      created_response(data: { bookmark: bookmark })
    else
      unprocessable_entity_response(errors: bookmark.errors.messages)
    end
  end
end
