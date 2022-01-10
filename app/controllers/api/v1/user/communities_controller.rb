class Api::V1::User::CommunitiesController < ApplicationController
  def index
    user = User.find(params[:user_id])

    communities = user.communities

    not_found_response unless communities.size.positive?
  end
end
