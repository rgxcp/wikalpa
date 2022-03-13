class Api::V1::Post::CollectionsController < ApplicationController
  def index
    post = Post.find(params[:post_id])
  end
end
