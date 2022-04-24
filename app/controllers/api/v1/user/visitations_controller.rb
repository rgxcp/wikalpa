class Api::V1::User::VisitationsController < ApplicationController
  before_action :authenticate_request, only: :index

  def index
    return forbidden_response unless @auth_id == params[:user_id].to_i

    visitations = @auth_user.visitations

    if visitations.present?
      ok_response(data: { visitations: visitations })
    else
      not_found_response
    end
  end
end
