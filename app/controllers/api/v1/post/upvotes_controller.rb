class Api::V1::Post::UpvotesController < Api::V1::UpvotesController
  private

  def set_upvoteable
    @upvoteable = Post.find(params[:post_id])
  end
end
