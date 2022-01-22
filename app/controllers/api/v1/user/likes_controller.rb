class Api::V1::User::LikesController < ApplicationController
  def index
    user = User.find(params[:user_id])
  end
end
