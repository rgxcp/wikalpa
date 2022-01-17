class Api::V1::Community::VisitorsController < ApplicationController
  def index
    community = Community.find(params[:community_id])
  end
end
