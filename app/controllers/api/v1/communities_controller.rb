class Api::V1::CommunitiesController < ApplicationController
  before_action :authenticate_request, only: [:create, :update]

  def show
    community = Community.find(params[:id])

    ok_response(data: { community: community })
  end

  def create
    community = Community.new(community_params)

    if community.save
      community.members.create(user: @auth_user)
      created_response(data: { community: community })
    else
      unprocessable_entity_response(errors: community.errors.messages)
    end
  end

  def update
    community = Community.find(params[:id])
    return forbidden_response unless community.members.exists?(user: @auth_user)

    if community.update(community_params)
      ok_response(data: { community: community })
    else
      unprocessable_entity_response(errors: community.errors.messages)
    end
  end

  private

  def community_params
    params.require(:community).permit(:name, :description)
  end
end
