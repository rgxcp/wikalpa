class Api::V1::AuthController < ApplicationController
  def register
    user = User.new(user_params)

    render json: {
      success: false
    },
    status: :unprocessable_entity unless user.save
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :password_confirmation
    )
  end
end
