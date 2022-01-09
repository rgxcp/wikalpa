class Api::V1::Post::LikesController < Api::V1::LikesController
  before_action :set_post, only: :index

  def index
    likes = @likeable.likes

    if likes.size.positive?
      ok_response(data: { likes: likes })
    else
      not_found_response
    end
  end

  private

  def set_likeable
    @likeable = Post.find(params[:post_id])
  end

  alias set_post set_likeable
end
