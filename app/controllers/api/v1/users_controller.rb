class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request, only: :update

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
