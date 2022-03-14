class Api::V1::Reply::CollectionsController < ApplicationController
  def index
    reply = Reply.find(params[:reply_id])

    collections = reply.collections

    not_found_response unless collections.size.positive?
  end
end
