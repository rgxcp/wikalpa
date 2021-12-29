class Api::V1::PostsController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    community = Community.find(params[:community_id])
    member = community.members.exists?(user: @auth_user)

    render json: {
      success: false,
      message: "Forbidden"
    },
    status: :forbidden unless member
  end
end
