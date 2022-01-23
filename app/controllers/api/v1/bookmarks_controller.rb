class Api::V1::BookmarksController < ApplicationController
  before_action :authenticate_request, only: [:create, :destroy]
  before_action :set_bookmarkable, only: :create

  def create
    bookmark = @bookmarkable.bookmarks.build(user: @auth_user)

    if bookmark.save
      created_response(data: { bookmark: bookmark })
    else
      unprocessable_entity_response(errors: bookmark.errors.messages)
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    return forbidden_response unless @auth_user.id == bookmark.user_id

    bookmark.destroy

    ok_response(data: { bookmark: bookmark })
  end
end
