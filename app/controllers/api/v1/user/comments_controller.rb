class Api::V1::User::CommentsController < ApplicationController
  def index
    user = User.find(params[:user_id])
  end
end
