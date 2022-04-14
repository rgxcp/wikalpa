class Api::V1::Reply::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    reply = Reply.find(params[:reply_id])

    downvote = reply.downvotes.build(user: @auth_user)

    unprocessable_entity_response(errors: downvote.errors.messages) unless downvote.save
  end
end
