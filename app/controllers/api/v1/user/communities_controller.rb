class Api::V1::User::CommunitiesController < ApplicationController
  def index
    user = User.find(params[:user_id])

    communities = user.communities

    if communities.size.positive?
      ok_response(data: { communities: communities })
    else
      not_found_response
    end
  end
end
