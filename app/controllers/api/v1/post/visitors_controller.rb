class Api::V1::Post::VisitorsController < ApplicationController
  def index
    post = Post.find(params[:post_id])

    visitors = post.visitors

    if visitors.size.positive?
      ok_response(data: { visitors: visitors })
    else
      not_found_response
    end
  end
end
