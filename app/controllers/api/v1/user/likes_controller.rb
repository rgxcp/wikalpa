class Api::V1::User::LikesController < ApplicationController
  def index
    user = User.find(params[:user_id])

    likes = user.likes

    if likes.size.positive?
      ok_response(data: { likes: likes })
    else
      not_found_response
    end
  end
end
