class Api::V1::User::SessionsController < ApplicationController
  before_action :authenticate_request, only: :index

  def index
    return forbidden_response unless @auth_id == params[:user_id].to_i

    sessions = @auth_user.sessions
    ok_response(data: { sessions: sessions })
  end
end
