class Api::V1::Reply::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    reply = Reply.find(params[:reply_id])

    downvote = reply.downvotes.build(user: @auth_user)

    if downvote.save
      created_response(data: { downvote: downvote })
    else
      unprocessable_entity_response(errors: downvote.errors.messages)
    end
  end
end
