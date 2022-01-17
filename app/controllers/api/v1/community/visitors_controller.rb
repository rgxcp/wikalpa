class Api::V1::Community::VisitorsController < ApplicationController
  def index
    community = Community.find(params[:community_id])

    visitors = community.visitors

    if visitors.size.positive?
      ok_response(data: { visitors: visitors })
    else
      not_found_response
    end
  end
end
