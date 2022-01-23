class Api::V1::Comment::BookmarksController < Api::V1::BookmarksController
  private

  def set_bookmarkable
    @bookmarkable = Comment.find(params[:comment_id])
  end
end
