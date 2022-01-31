class Api::V1::Collection::CollectionItemsController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    collection = Collection.find(params[:collection_id])

    forbidden_response unless @auth_id == collection.user_id
  end
end
