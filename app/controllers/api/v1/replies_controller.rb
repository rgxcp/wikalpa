class Api::V1::RepliesController < ApplicationController
  before_action :authenticate_request, only: :update
  before_action :set_reply, only: [:show, :update]

  def show
    ok_response(data: { reply: @reply })
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
