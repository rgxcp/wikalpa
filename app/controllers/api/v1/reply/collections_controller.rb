class Api::V1::Reply::CollectionsController < ApplicationController
  def index
    reply = Reply.find(params[:reply_id])
  end
end
