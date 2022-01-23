class Api::V1::Comment::BookmarksController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    comment = Comment.find(params[:comment_id])
  end
end
