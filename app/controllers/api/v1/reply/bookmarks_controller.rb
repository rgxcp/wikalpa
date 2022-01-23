class Api::V1::Reply::BookmarksController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    reply = Reply.find(params[:reply_id])

    bookmark = reply.bookmarks.build(user: @auth_user)

    if bookmark.save
      created_response(data: { bookmark: bookmark })
    else
      unprocessable_entity_response(errors: bookmark.errors.messages)
    end
  end
end
