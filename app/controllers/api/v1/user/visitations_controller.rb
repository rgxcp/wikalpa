class Api::V1::User::VisitationsController < ApplicationController
  before_action :authenticate_request, only: :index

  def index
    return forbidden_response unless @auth_id == params[:user_id].to_i

    visitations = @auth_user.visitations

    not_found_response unless visitations.present?
  end
end
