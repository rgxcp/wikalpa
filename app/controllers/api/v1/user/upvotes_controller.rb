class Api::V1::User::UpvotesController < Api::V1::UpvotesController
  private

  def set_upvoteable
    @upvoteable = User.find(params[:user_id])
  end
end
