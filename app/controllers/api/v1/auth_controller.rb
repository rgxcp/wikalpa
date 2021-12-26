require "json_web_token"

class Api::V1::AuthController < ApplicationController
  def register
    user = User.new(user_params)

    if user.save
      token = JsonWebToken.encode({ id: user.id })

      render json: {
        success: true,
        message: "Created",
        data: {
          user: user,
          token: token
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

  def login
    user = User.find_by!(username: params[:username])

    render json: {
      status: false,
      message: "Unauthorized"
    },
    status: :unauthorized unless user.authenticate(params[:password])
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
