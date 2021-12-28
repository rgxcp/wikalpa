class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request!, only: :update

  def update
    return forbidden_response unless @auth_id == params[:id].to_i

    user = User.find(params[:id])
  end
end
