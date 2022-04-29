class Api::V1::User::UsernameHistoriesController < ApplicationController
  def index
    user = User.find(params[:user_id])
  end
end
