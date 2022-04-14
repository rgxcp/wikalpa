class Api::V1::Post::DownvotesController < Api::V1::DownvotesController
  private

  def set_downvoteable
    @downvoteable = Post.find(params[:post_id])
  end
end
