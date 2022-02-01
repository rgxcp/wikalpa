class Api::V1::Collection::CollectionItemsController < ApplicationController
  before_action :authenticate_request, only: [:create, :destroy]

  def create
    collection = Collection.find(params[:collection_id])
    return forbidden_response unless @auth_id == collection.user_id

    collection_item = collection.collection_items.build(collection_item_params)

    if collection_item.save
      created_response(data: { collection_item: collection_item })
    else
      unprocessable_entity_response(errors: collection_item.errors.messages)
    end
  end

  def destroy
    collection = Collection.find(params[:collection_id])

    forbidden_response unless @auth_id == collection.user_id
  end

  private

  def collection_item_params
    params.require(:collection_item).permit(:collectable_type, :collectable_id)
  end
end
