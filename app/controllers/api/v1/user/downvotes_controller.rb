class Api::V1::User::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :index

  def index
    return forbidden_response unless @auth_id == params[:user_id].to_i
  end
end
