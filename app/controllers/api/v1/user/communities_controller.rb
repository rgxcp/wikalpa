class Api::V1::User::CommunitiesController < ApplicationController
  def index
    user = User.find(params[:user_id])
  end
end
