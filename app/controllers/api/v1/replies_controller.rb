class Api::V1::RepliesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    comment = Comment.find(params[:comment_id])

    reply = comment.replies.build(reply_params)
    reply.user = @auth_user

    unprocessable_entity_response(errors: reply.errors.messages) unless reply.save
  end

  private

  def reply_params
    params.require(:reply).permit(:body)
  end
end
