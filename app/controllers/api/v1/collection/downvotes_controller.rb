class Api::V1::Collection::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    collection = Collection.find(params[:collection_id])

    downvote = collection.downvotes.build(user: @auth_user)

    unprocessable_entity_response(errors: downvote.errors.messages) unless downvote.save
  end
end
