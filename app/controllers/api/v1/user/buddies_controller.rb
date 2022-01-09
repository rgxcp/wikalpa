class Api::V1::User::BuddiesController < ApplicationController
  before_action :authenticate_request, only: :create
  before_action :set_user, only: [:index, :create]

  def index
    buddies = @user.buddies

    if buddies.size.positive?
      ok_response(data: { buddies: buddies })
    else
      not_found_response
    end
  end

  def create
    buddy = @auth_user.buddies.build(buddy: @user)

    if buddy.save
      created_response(data: { buddy: buddy })
    else
      unprocessable_entity_response(errors: buddy.errors.messages)
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
