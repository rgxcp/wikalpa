class Api::V1::AuthController < ApplicationController
  def register
    user = User.new(user_params)

    if user.save
      render json: {
        success: true,
        message: "Created",
        data: {
          user: user
        }
      },
      status: :created,
      except: :password_digest
    else
      render json: {
        success: false,
        message: "Unprocessable Entity",
        errors: user.errors.messages
      },
      status: :unprocessable_entity
    end
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
