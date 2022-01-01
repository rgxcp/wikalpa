class Api::V1::RepliesController < ApplicationController
  before_action :authenticate_request, only: [:create, :update]

  def create
    comment = Comment.find(params[:comment_id])

    reply = comment.replies.build(reply_params)
    reply.user = @auth_user

    if reply.save
      created_response(data: { reply: reply })
    else
      unprocessable_entity_response(errors: reply.errors.messages)
    end
  end

  def update
  end

  private

  def reply_params
    params.require(:reply).permit(:body)
  end
end
