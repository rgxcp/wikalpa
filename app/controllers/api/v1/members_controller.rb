class Api::V1::MembersController < ApplicationController
  before_action :authenticate_request!, only: :create

  def create
    community = Community.find(params[:community_id])
    member = community.members.build(user: @auth_user)

    if member.save
      render json: {
        success: true,
        message: "Created",
        data: {
          member: member
        }
      },
      status: :created
    else
      unprocessable_entity_response(errors: member.errors.messages)
    end
  end
end
