class Api::V1::Reply::DownvotesController < Api::V1::DownvotesController
  private

  def set_downvoteable
    @downvoteable = Reply.find(params[:reply_id])
  end
end
