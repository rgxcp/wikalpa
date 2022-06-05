class Api::V1::SessionsController < ApplicationController
  before_action :authenticate_request, only: :destroy

  def destroy
    session = Session.find(params[:id])

    forbidden_response unless @auth_id == session.user_id
  end
end
