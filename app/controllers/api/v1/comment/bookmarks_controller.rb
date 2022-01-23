class Api::V1::Comment::BookmarksController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    comment = Comment.find(params[:comment_id])

    bookmark = comment.bookmarks.build(user: @auth_user)

    unprocessable_entity_response(errors: bookmark.errors.messages) unless bookmark.save
  end
end
