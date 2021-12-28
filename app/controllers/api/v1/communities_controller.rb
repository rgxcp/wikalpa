class Api::V1::CommunitiesController < ApplicationController
  before_action :authenticate_request!, only: :create

  def create
    community = Community.new(community_params)

    if community.save
      Member.create(community: community, user_id: @auth_id)

      render json: {
        success: true,
        message: "Created",
        data: {
          community: community
        }
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
