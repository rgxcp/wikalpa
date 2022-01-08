class Api::V1::BuddiesController < ApplicationController
  before_action :authenticate_request, only: [:create, :destroy]
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

  def destroy
    buddy = Buddy.find(params[:id])
    return forbidden_response unless @auth_user.id == buddy.user_id

    buddy.destroy

    ok_response(data: { buddy: buddy })
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
