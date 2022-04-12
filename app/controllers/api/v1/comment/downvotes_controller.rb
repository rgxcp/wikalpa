class Api::V1::Comment::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    comment = Comment.find(params[:comment_id])

    downvote = comment.downvotes.build(user: @auth_user)

    if downvote.save
      created_response(data: { downvote: downvote })
    else
      unprocessable_entity_response(errors: downvote.errors.messages)
    end
  end
end
