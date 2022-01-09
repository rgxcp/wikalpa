class Api::V1::Post::LikesController < Api::V1::LikesController
  before_action :set_post, only: :index

  def index
    likes = @likeable.likes

    not_found_response unless likes.size.positive?
  end

  private

  def set_likeable
    @likeable = Post.find(params[:post_id])
  end

  alias set_post set_likeable
end
