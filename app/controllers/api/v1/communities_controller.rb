class Api::V1::CommunitiesController < ApplicationController
  before_action :authenticate_request, only: [:create, :update]
  before_action :set_community, only: [:show, :update]

  def index
    communities = Community.all

    not_found_response unless communities.size.positive?
  end

  def show
    ok_response(data: { community: @community })
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
    return forbidden_response unless @community.members.exists?(user: @auth_user)

    if @community.update(community_params)
      ok_response(data: { community: @community })
    else
      unprocessable_entity_response(errors: @community.errors.messages)
    end
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:name, :description)
  end
end
