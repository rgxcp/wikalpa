class Api::V1::User::VisitationsController < ApplicationController
  before_action :authenticate_request, only: :index

  def index
    forbidden_response unless @auth_id == params[:user_id].to_i
  end
end
