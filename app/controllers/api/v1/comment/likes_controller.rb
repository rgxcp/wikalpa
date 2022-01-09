class Api::V1::Comment::LikesController < Api::V1::LikesController
  before_action :set_comment, only: :index

  def index
  end

  private

  def set_likeable
    @likeable = Comment.find(params[:comment_id])
  end

  alias set_comment set_likeable
end
