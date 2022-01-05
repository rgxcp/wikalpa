class Api::V1::Post::LikesController < Api::V1::LikesController
  private

  def set_likeable
    @likeable = Post.find(params[:post_id])
  end
end
