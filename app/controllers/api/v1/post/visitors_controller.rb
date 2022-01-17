class Api::V1::Post::VisitorsController < ApplicationController
  def index
    post = Post.find(params[:post_id])

    visitors = post.visitors

    not_found_response unless visitors.size.positive?
  end
end
