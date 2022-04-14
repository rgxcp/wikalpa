class Api::V1::Reply::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    reply = Reply.find(params[:reply_id])
  end
end
