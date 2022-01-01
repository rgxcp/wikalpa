class Api::V1::BuddiesController < ApplicationController
  before_action :authenticate_request, only: :follow

  def follow
    user = User.find(params[:user_id])

    buddy = @auth_user.buddies.build(buddy: user)

    unprocessable_entity_response(errors: buddy.errors.messages) unless buddy.save
  end
end
