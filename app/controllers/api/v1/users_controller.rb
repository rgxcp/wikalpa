class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request!, only: :update

  def update
    forbidden_response unless @auth_id == params[:id].to_i
  end
end
