class Api::V1::Community::CollectionsController < ApplicationController
  def index
    community = Community.find(params[:community_id])

    collections = community.collections

    if collections.present?
      ok_response(data: { collections: collections })
    else
      not_found_response
    end
  end
end
