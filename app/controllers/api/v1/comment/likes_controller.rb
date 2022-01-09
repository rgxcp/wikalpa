class Api::V1::Comment::LikesController < Api::V1::LikesController
  before_action :set_comment, only: :index

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
    @likeable = Comment.find(params[:comment_id])
  end

  alias set_comment set_likeable
end
