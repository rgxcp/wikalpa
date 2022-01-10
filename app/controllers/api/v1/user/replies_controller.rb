class Api::V1::User::RepliesController < ApplicationController
  def index
    user = User.find(params[:user_id])

    replies = user.replies

    if replies.size.positive?
      ok_response(data: { replies: replies })
    else
      not_found_response
    end
  end
end
