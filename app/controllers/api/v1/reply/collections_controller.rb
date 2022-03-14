class Api::V1::Reply::CollectionsController < ApplicationController
  def index
    reply = Reply.find(params[:reply_id])

    collections = reply.collections

    if collections.size.positive?
      ok_response(data: { collections: collections })
    else
      not_found_response
    end
  end
end
