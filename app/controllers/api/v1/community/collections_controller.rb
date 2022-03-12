class Api::V1::Community::CollectionsController < ApplicationController
  def index
    community = Community.find(params[:community_id])
  end
end
