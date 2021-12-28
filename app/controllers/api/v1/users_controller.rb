class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request!, only: :update

  def update
    render json: {
      success: false,
      message: "Forbidden"
    },
    status: :forbidden unless @auth_id == params[:id].to_i
  end
end
