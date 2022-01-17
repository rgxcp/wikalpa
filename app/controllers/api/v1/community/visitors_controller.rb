class Api::V1::Community::VisitorsController < ApplicationController
  def index
    community = Community.find(params[:community_id])

    visitors = community.visitors

    not_found_response unless visitors.size.positive?
  end
end
