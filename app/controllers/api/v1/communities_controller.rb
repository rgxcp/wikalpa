class Api::V1::CommunitiesController < ApplicationController
  before_action :authenticate_request!, only: :create

  def create
    community = Community.new(community_params)

    render json: {
      success: false,
      message: "Unprocessable Entity",
      errors: community.errors.messages
    },
    status: :unprocessable_entity unless community.save
  end

  private

  def community_params
    params.require(:community).permit(
      :name,
      :description
    )
  end
end
