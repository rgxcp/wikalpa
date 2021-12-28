class Api::V1::CommunitiesController < ApplicationController
  before_action :authenticate_request!, only: :create

  def create
    community = Community.new(community_params)

    if community.save
      render json: {
        success: true,
        message: "Created"
      },
      status: :created
    else
      unprocessable_entity_response(errors: community.errors.messages)
    end
  end

  private

  def community_params
    params.require(:community).permit(
      :name,
      :description
    )
  end
end
