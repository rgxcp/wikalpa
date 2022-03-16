class Api::V1::Reply::UpvotesController < Api::V1::UpvotesController
  private

  def set_upvoteable
    @upvoteable = Reply.find(params[:reply_id])
  end
end
