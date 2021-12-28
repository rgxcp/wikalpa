class Api::V1::MembersController < ApplicationController
  before_action :authenticate_request!, only: :create

  def create
    community = Community.find(params[:community_id])
    member = community.members.build(user: @auth_user)

    unprocessable_entity_response(errors: member.errors.messages) unless member.save
  end
end
