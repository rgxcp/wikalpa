class Api::V1::Post::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    post = Post.find(params[:post_id])

    downvote = post.downvotes.build(user: @auth_user)

    unprocessable_entity_response(errors: downvote.errors.messages) unless downvote.save
  end
end
