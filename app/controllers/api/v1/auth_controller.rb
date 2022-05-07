class Api::V1::AuthController < ApplicationController
  def register
    user = User.new(user_params)

    if user.save
      token = JsonWebToken.encode({ id: user.id })
      created_response(data: { user: user, token: token }, except: :password_digest)
    else
      unprocessable_entity_response(errors: user.errors.messages)
    end
  end

  def login
    user = User.find_by!(username: params[:username])
    return too_many_requests_response unless user.allow_login?

    if user.authenticate(params[:password])
      token = JsonWebToken.encode({ id: user.id })
      ok_response(data: { user: user, token: token }, except: :password_digest)
    else
      user.increment_login_tries_count!
      unauthorized_response
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
