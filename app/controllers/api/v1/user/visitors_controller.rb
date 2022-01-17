class Api::V1::User::VisitorsController < ApplicationController
  def index
    user = User.find(params[:user_id])
  end
end
