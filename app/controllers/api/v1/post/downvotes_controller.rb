class Api::V1::Post::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    post = Post.find(params[:post_id])

    downvote = post.downvotes.build(user: @auth_user)

    if downvote.save
      created_response(data: { downvote: downvote })
    else
      unprocessable_entity_response(errors: downvote.errors.messages)
    end
  end
end
