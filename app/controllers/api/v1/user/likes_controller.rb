class Api::V1::User::LikesController < ApplicationController
  def index
    user = User.find(params[:user_id])

    likes = user.likes

    not_found_response unless likes.size.positive?
  end
end
