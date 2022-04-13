class Api::V1::Post::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    post = Post.find(params[:post_id])
  end
end
