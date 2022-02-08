class Api::V1::Comment::CollectionsController < ApplicationController
  def index
    comment = Comment.find(params[:comment_id])

    collections = comment.collections

    not_found_response unless collections.size.positive?
  end
end
