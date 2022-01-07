class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request, only: :update

  def index
    users = User.all

    if users.size.positive?
      ok_response(data: { users: users }, except: :password_digest)
    else
      not_found_response
    end
  end

  def show
    user = User.find(params[:id])

    ok_response(data: { user: user }, except: :password_digest)
  end

  def update
    return forbidden_response unless @auth_user.id == params[:id].to_i

    if @auth_user.update(user_params)
      ok_response(data: { user: @auth_user }, except: :password_digest)
    else
      unprocessable_entity_response(errors: @auth_user.errors.messages)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
