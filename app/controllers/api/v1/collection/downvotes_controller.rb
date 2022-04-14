class Api::V1::Collection::DownvotesController < Api::V1::DownvotesController
  private

  def set_downvoteable
    @downvoteable = Collection.find(params[:collection_id])
  end
end
