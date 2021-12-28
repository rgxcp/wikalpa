class Api::V1::CommunitiesController < ApplicationController
  before_action :authenticate_request!, only: [:create, :update]

  def create
    community = Community.new(community_params)

    if community.save
      Member.create(community: community, user: @auth_user)

      created_response(data: {
        community: community
      })
    else
      unprocessable_entity_response(errors: community.errors.messages)
    end
  end

  def update
    community = Community.find(params[:id])

    member = Member.exists?(community: community, user: @auth_user)
    return forbidden_response unless member

    unprocessable_entity_response(errors: community.errors.messages) unless community.update(community_params)
  end

  private

  def community_params
    params.require(:community).permit(
      :name,
      :description
    )
  end
end
