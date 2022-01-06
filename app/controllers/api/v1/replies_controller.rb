class Api::V1::RepliesController < ApplicationController
  before_action :authenticate_request, only: [:create, :update]
  before_action :set_reply, only: [:show, :update]

  def show
    ok_response(data: { reply: @reply })
  end

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
    return forbidden_response unless @auth_user.id == @reply.user_id

    if @reply.update(reply_params)
      ok_response(data: { reply: @reply })
    else
      unprocessable_entity_response(errors: @reply.errors.messages)
    end
  end

  private

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:body)
  end
end
