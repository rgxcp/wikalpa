require "json_web_token"

class Api::V1::AuthController < ApplicationController
  def register
    user = User.new(user_params)

    if user.save
      token = JsonWebToken.encode({ id: user.id })

      created_response(
        data: {
          user: user,
          token: token
        },
        except: :password_digest
      )
    else
      unprocessable_entity_response(errors: user.errors.messages)
    end
  end

  def login
    user = User.find_by!(username: params[:username])

    if user.authenticate(params[:password])
      token = JsonWebToken.encode({ id: user.id })

      render json: {
        success: true,
        message: "OK",
        data: {
          user: user,
          token: token
        }
      },
      status: :ok,
      except: :password_digest
    else
      render json: {
        success: false,
        message: "Unauthorized"
      },
      status: :unauthorized
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
