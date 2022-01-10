class Api::V1::User::PostsController < ApplicationController
  def index
    user = User.find(params[:user_id])

    posts = user.posts

    not_found_response unless posts.size.positive?
  end
end
