class Api::V1::SessionsController < ApplicationController
  before_action :authenticate_request, only: :destroy

  def destroy
    session = Session.find(params[:id])
    return forbidden_response unless @auth_id == session.user_id

    session.destroy

    ok_response(data: { session: session })
  end
end
