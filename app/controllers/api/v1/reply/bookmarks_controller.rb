class Api::V1::Reply::BookmarksController < Api::V1::BookmarksController
  private

  def set_bookmarkable
    @bookmarkable = Reply.find(params[:reply_id])
  end
end
