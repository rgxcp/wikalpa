class Api::V1::Community::MembersController < ApplicationController
  before_action :authenticate_request, only: :create
  before_action :set_community, only: [:index, :create]

  def index
    members = @community.members

    if members.size.positive?
      ok_response(data: { members: members })
    else
      not_found_response
    end
  end

  def create
    member = @community.members.build(user: @auth_user)

    if member.save
      created_response(data: { member: member })
    else
      unprocessable_entity_response(errors: member.errors.messages)
    end
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end
end
