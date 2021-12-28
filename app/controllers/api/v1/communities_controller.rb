class Api::V1::CommunitiesController < ApplicationController
  before_action :authenticate_request, only: [:create, :update]

  def create
    community = Community.new(community_params)

    if community.save
      community.members.create(user: @auth_user)

      created_response(data: {
        community: community
      })
    else
      unprocessable_entity_response(errors: community.errors.messages)
    end
  end

  def update
    community = Community.find(params[:id])
    member = community.members.exists?(user: @auth_user)
    return forbidden_response unless member

    if community.update(community_params)
      ok_response(data: {
        community: community
      })
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
