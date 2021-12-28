class Api::V1::MembersController < ApplicationController
  before_action :authenticate_request!, only: [:join, :leave]

  def join
    community = Community.find(params[:community_id])
    member = community.members.build(user: @auth_user)

    if member.save
      created_response(data: {
        member: member
      })
    else
      unprocessable_entity_response(errors: member.errors.messages)
    end
  end

  def leave
    community = Community.find(params[:community_id])
    member = community.members.find_by!(user: @auth_user)
    member.destroy

    render json: {
      success: true
    },
    status: :ok
  end
end
