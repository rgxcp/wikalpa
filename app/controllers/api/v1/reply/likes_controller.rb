class Api::V1::Reply::LikesController < Api::V1::LikesController
  before_action :set_reply, only: :index

  def index
  end

  private

  def set_likeable
    @likeable = Reply.find(params[:reply_id])
  end

  alias set_reply set_likeable
end
