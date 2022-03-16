class Api::V1::Collection::UpvotesController < Api::V1::UpvotesController
  private

  def set_upvoteable
    @upvoteable = Collection.find(params[:collection_id])
  end
end
