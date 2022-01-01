class Api::V1::BuddiesController < ApplicationController
  before_action :authenticate_request, only: :follow

  def follow
    user = User.find(params[:user_id])
  end
end
