class Api::V1::Comment::CollectionsController < ApplicationController
  def index
    comment = Comment.find(params[:comment_id])

    collections = comment.collections

    if collections.present?
      ok_response(data: { collections: collections })
    else
      not_found_response
    end
  end
end
