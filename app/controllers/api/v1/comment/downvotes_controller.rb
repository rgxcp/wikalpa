class Api::V1::Comment::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    comment = Comment.find(params[:comment_id])

    downvote = comment.downvotes.build(user: @auth_user)

    unprocessable_entity_response(errors: downvote.errors.messages) unless downvote.save
  end
end
