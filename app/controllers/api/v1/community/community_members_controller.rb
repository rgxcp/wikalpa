class Api::V1::Community::CommunityMembersController < ApplicationController
  before_action :authenticate_request, only: :create
  before_action :set_community, only: [:index, :create]

  def index
    community_members = @community.community_members

    if community_members.present?
      ok_response(data: { community_members: community_members })
    else
      not_found_response
    end
  end

  def create
    community_member = @community.community_members.build(user: @auth_user)

    if community_member.save
      created_response(data: { community_member: community_member })
    else
      unprocessable_entity_response(errors: community_member.errors.messages)
    end
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end
end
