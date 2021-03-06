class Api::V1::CommunitiesController < ApplicationController
  before_action :parse_auth_id, only: :show
  before_action :authenticate_request, only: [:create, :update]
  before_action :set_community, only: [:show, :update]

  def index
    communities = Community.all

    if communities.present?
      ok_response(data: { communities: communities })
    else
      not_found_response
    end
  end

  def show
    VisitorWorker.perform_async("Community", @community.id, @auth_id) if @auth_id

    ok_response(data: { community: @community })
  end

  def create
    community = Community.new(community_params)

    if community.save
      community.community_members.create(user: @auth_user)
      created_response(data: { community: community })
    else
      unprocessable_entity_response(errors: community.errors.messages)
    end
  end

  def update
    return forbidden_response unless @community.community_member?(@auth_user)

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
