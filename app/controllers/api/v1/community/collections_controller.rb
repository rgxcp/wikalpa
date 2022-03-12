class Api::V1::Community::CollectionsController < ApplicationController
  def index
    community = Community.find(params[:community_id])

    collections = community.collections

    not_found_response unless collections.size.positive?
  end
end
