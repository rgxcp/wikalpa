class Api::V1::BuddiesController < ApplicationController
  before_action :authenticate_request, only: [:follow, :unfollow]
  before_action :set_user, only: [:follow, :unfollow]

  def follow
    buddy = @auth_user.buddies.new(buddy: @user)

    if buddy.save
      created_response(data: { buddy: buddy })
    else
      unprocessable_entity_response(errors: buddy.errors.messages)
    end
  end

  def unfollow
    buddy = @auth_user.buddies.find_by!(buddy: @user)
    buddy.destroy

    ok_response(data: { buddy: buddy })
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
