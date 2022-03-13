class Api::V1::Post::CollectionsController < ApplicationController
  def index
    post = Post.find(params[:post_id])

    collections = post.collections

    not_found_response unless collections.size.positive?
  end
end
