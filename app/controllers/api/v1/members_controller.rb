class Api::V1::MembersController < ApplicationController
  before_action :authenticate_request, only: [:create, :destroy]
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

  def destroy
    member = Member.find(params[:id])
    return forbidden_response unless @auth_user.id == member.user_id

    member.destroy

    ok_response(data: { member: member })
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end
end
