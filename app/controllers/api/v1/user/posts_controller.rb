class Api::V1::User::PostsController < ApplicationController
  def index
    user = User.find(params[:user_id])

    posts = user.posts

    if posts.size.positive?
      ok_response(data: { posts: posts })
    else
      not_found_response
    end
  end
end
