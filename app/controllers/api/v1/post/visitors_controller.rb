class Api::V1::Post::VisitorsController < ApplicationController
  def index
    post = Post.find(params[:post_id])
  end
end
