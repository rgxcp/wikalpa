class Api::V1::User::LikesController < Api::V1::LikesController
  private

  def set_likeable
    @likeable = User.find(params[:user_id])
  end
end
