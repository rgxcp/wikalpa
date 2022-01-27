class Api::V1::CollectionsController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    collection = Collection.new(collection_params)
    collection.user = @auth_user

    unprocessable_entity_response(errors: collection.errors.messages) unless collection.save
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :collection_items_attributes)
  end
end
