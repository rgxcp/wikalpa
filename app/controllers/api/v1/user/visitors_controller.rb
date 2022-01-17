class Api::V1::User::VisitorsController < ApplicationController
  def index
    user = User.find(params[:user_id])

    visitors = user.visitors

    not_found_response unless visitors.size.positive?
  end
end
