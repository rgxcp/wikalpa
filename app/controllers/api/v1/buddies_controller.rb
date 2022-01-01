class Api::V1::BuddiesController < ApplicationController
  before_action :authenticate_request, only: [:follow, :unfollow]

  def follow
    user = User.find(params[:user_id])

    buddy = @auth_user.buddies.build(buddy: user)

    if buddy.save
      created_response(data: { buddy: buddy })
    else
      unprocessable_entity_response(errors: buddy.errors.messages)
    end
  end

  def unfollow
    user = User.find(params[:user_id])

    buddy = @auth_user.buddies.find_by!(buddy: user)
  end
end
