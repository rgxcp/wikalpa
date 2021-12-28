class Api::V1::CommunitiesController < ApplicationController
  before_action :authenticate_request!, only: [:create, :update]

  def create
    community = Community.new(community_params)

    if community.save
      Member.create(community: community, user_id: @auth_id)

      created_response(data: {
        community: community
      })
    else
      unprocessable_entity_response(errors: community.errors.messages)
    end
  end

  def update
    community = Community.find(params[:id])
  end

  private

  def community_params
    params.require(:community).permit(
      :name,
      :description
    )
  end
end
