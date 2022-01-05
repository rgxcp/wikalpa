class Api::V1::Comment::LikesController < Api::V1::LikesController
  private

  def set_likeable
    @likeable = Comment.find(params[:comment_id])
  end
end
