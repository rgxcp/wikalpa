class Api::V1::Collection::LikesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    collection = Collection.find(params[:collection_id])

    like = collection.likes.build(user: @auth_user)

    unprocessable_entity_response(errors: like.errors.messages) unless like.save
  end
end
