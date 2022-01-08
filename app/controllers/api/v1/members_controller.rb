class Api::V1::MembersController < ApplicationController
  before_action :authenticate_request, only: [:create, :destroy]

  def index
    community = Community.find(params[:community_id])

    members = community.members

    not_found_response unless members.size.positive?
  end

  def create
    community = Community.find(params[:community_id])

    member = community.members.build(user: @auth_user)

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
end
