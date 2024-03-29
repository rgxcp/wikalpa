class Api::V1::CollectionsController < ApplicationController
  before_action :parse_auth_id, only: :show
  before_action :authenticate_request, only: [:create, :update]
  before_action :set_collection, only: [:show, :update]

  def index
    collections = Collection.all

    if collections.present?
      ok_response(data: { collections: collections })
    else
      not_found_response
    end
  end

  def show
    VisitorWorker.perform_async("Collection", @collection.id, @auth_id) if @auth_id

    ok_response(data: { collection: @collection })
  end

  def create
    collection = Collection.new(collection_params)
    collection.user = @auth_user

    if collection.save
      created_response(data: { collection: collection })
    else
      unprocessable_entity_response(errors: collection.errors.messages)
    end
  end

  def update
    return forbidden_response unless current_user?(@collection.user_id)

    if @collection.update(collection_update_params)
      ok_response(data: { collection: @collection })
    else
      unprocessable_entity_response(errors: @collection.errors.messages)
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name, collection_items_attributes: [:collectable_type, :collectable_id])
  end

  def collection_update_params
    params.require(:collection).permit(:name)
  end
end
