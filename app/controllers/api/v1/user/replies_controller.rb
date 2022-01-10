class Api::V1::User::RepliesController < ApplicationController
  def index
    user = User.find(params[:user_id])
  end
end
