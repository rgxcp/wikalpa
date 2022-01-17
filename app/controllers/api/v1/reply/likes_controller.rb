class Api::V1::Reply::LikesController < Api::V1::LikesController
  private

  def set_likeable
    @likeable = Reply.find(params[:reply_id])
  end
end
