class Api::V1::Comment::CollectionsController < ApplicationController
  def index
    comment = Comment.find(params[:comment_id])
  end
end
