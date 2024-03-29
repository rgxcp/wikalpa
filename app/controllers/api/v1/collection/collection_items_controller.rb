require "string"

class Api::V1::Collection::CollectionItemsController < ApplicationController
  before_action :authenticate_request, except: :index
  before_action :set_collection
  before_action :check_user_ability, only: [:create, :destroy, :destroy_all]

  def index
    collection_items = @collection.collection_items

    ok_response(data: { collection_items: collection_items })
  end

  def create
    collection_item = @collection.collection_items.build(collection_item_params)

    if collection_item.save
      created_response(data: { collection_item: collection_item })
    else
      unprocessable_entity_response(errors: collection_item.errors.messages)
    end
  end

  def destroy
    collection_item = @collection.collection_items.find(params[:id])
    collection_item.destroy

    CollectionWorker.perform_async(@collection.id)

    ok_response(data: { collection_item: collection_item })
  end

  def destroy_all
    if !params[:ids].present? || !params[:ids].is_a?(Array)
      return bad_request_response(errors: ["Query parameters of 'ids' must be present"])
    end

    params[:ids].each do |id|
      return bad_request_response(errors: ["Query parameters of 'ids' must be valid integers"]) unless id.integer?
    end

    collection_items = @collection.collection_items.where(id: params[:ids])
    collection_items = collection_items.destroy_all

    CollectionWorker.perform_async(@collection.id)

    ok_response(data: { collection_items: collection_items })
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def collection_item_params
    params.require(:collection_item).permit(:collectable_type, :collectable_id)
  end

  def check_user_ability
    return forbidden_response unless current_user?(@collection.user_id)
  end
end
