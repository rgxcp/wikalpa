class Api::V1::Collection::LikesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    collection = Collection.find(params[:collection_id])

    like = collection.likes.build(user: @auth_user)

    if like.save
      created_response(data: { like: like })
    else
      unprocessable_entity_response(errors: like.errors.messages)
    end
  end
end
