class Api::V1::Post::CollectionsController < ApplicationController
  def index
    post = Post.find(params[:post_id])

    collections = post.collections

    if collections.size.positive?
      ok_response(data: { collections: collections })
    else
      not_found_response
    end
  end
end
