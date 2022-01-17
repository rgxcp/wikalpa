class Api::V1::User::VisitorsController < ApplicationController
  def index
    user = User.find(params[:user_id])

    visitors = user.visitors

    if visitors.size.positive?
      ok_response(data: { visitors: visitors })
    else
      not_found_response
    end
  end
end
