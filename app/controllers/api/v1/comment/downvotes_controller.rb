class Api::V1::Comment::DownvotesController < Api::V1::DownvotesController
  private

  def set_downvoteable
    @downvoteable = Comment.find(params[:comment_id])
  end
end
