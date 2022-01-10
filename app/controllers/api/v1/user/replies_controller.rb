class Api::V1::User::RepliesController < ApplicationController
  def index
    user = User.find(params[:user_id])

    replies = user.replies

    not_found_response unless replies.size.positive?
  end
end
