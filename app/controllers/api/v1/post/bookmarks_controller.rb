class Api::V1::Post::BookmarksController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    post = Post.find(params[:post_id])

    bookmark = post.bookmarks.build(user: @auth_user)

    unprocessable_entity_response(errors: bookmark.errors.messages) unless bookmark.save
  end
end
