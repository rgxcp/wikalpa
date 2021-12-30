class Api::V1::MembersController < ApplicationController
  before_action :authenticate_request, only: [:join, :leave]
  before_action :set_community, only: [:join, :leave]

  def join
    member = @community.members.build(user: @auth_user)

    if member.save
      created_response(data: { member: member })
    else
      unprocessable_entity_response(errors: member.errors.messages)
    end
  end

  def leave
    member = @community.members.find_by!(user: @auth_user)
    member.destroy

    ok_response(data: { member: member })
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end
end
