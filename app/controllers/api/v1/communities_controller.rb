class Api::V1::CommunitiesController < ApplicationController
  before_action :authenticate_request!, only: :create

  def create
    community = Community.new(community_params)

    unprocessable_entity_response(errors: community.errors.messages) unless community.save
  end

  private

  def community_params
    params.require(:community).permit(
      :name,
      :description
    )
  end
end
