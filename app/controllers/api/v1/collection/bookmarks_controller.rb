class Api::V1::Collection::BookmarksController < Api::V1::BookmarksController
  private

  def set_bookmarkable
    @bookmarkable = Collection.find(params[:collection_id])
  end
end
