class Api::V1::Collection::CollectionItemsController < ApplicationController
  before_action :authenticate_request, only: [:create, :destroy]
  before_action :set_collection, only: [:index, :create, :destroy]

  def index
    collection_items = @collection.collection_items

    ok_response(data: { collection_items: collection_items })
  end

  def create
    return forbidden_response unless @auth_id == @collection.user_id

    collection_item = @collection.collection_items.build(collection_item_params)

    if collection_item.save
      created_response(data: { collection_item: collection_item })
    else
      unprocessable_entity_response(errors: collection_item.errors.messages)
    end
  end

  def destroy
    return forbidden_response unless @auth_id == @collection.user_id

    collection_item = @collection.collection_items.find(params[:id])
    collection_item.destroy

    CollectionWorker.perform_async(@collection.id)

    ok_response(data: { collection_item: collection_item })
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def collection_item_params
    params.require(:collection_item).permit(:collectable_type, :collectable_id)
  end
end
