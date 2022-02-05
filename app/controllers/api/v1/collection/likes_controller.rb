class Api::V1::Collection::LikesController < Api::V1::LikesController
  private

  def set_likeable
    @likeable = Collection.find(params[:collection_id])
  end
end
