class Api::V1::User::CollectionsController < ApplicationController
  def index
    user = User.find(params[:user_id])
  end
end
