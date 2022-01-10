class Api::V1::User::PostsController < ApplicationController
  def index
    user = User.find(params[:user_id])
  end
end
