class Api::V1::MembersController < ApplicationController
  before_action :authenticate_request!, only: :create

  def create
    community = Community.find(params[:community_id])
    member = community.members.build(user: @auth_user)

    render json: {
      success: false,
      message: "Unprocessable Entity",
      errors: member.errors.messages
    },
    status: :unprocessable_entity unless member.save
  end
end
