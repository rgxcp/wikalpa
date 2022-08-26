class Api::V1::BuddiesController < ApplicationController
  before_action :authenticate_request, only: :destroy

  def destroy
    buddy = Buddy.find(params[:id])
    return forbidden_response unless current_user?(buddy.user_id)

    buddy.destroy

    ok_response(data: { buddy: buddy })
  end
end
