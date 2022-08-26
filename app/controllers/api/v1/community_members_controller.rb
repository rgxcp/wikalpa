class Api::V1::CommunityMembersController < ApplicationController
  before_action :authenticate_request, only: :destroy

  def destroy
    community_member = CommunityMember.find(params[:id])
    return forbidden_response unless current_user?(community_member.user_id)

    community_member.destroy

    ok_response(data: { community_member: community_member })
  end
end
