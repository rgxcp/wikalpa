class Api::V1::Post::BookmarksController < Api::V1::BookmarksController
  private

  def set_bookmarkable
    @bookmarkable = Post.find(params[:post_id])
  end
end
