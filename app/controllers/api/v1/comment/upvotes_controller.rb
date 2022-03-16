class Api::V1::Comment::UpvotesController < Api::V1::UpvotesController
  private

  def set_upvoteable
    @upvoteable = Comment.find(params[:comment_id])
  end
end
