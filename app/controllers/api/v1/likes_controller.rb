class Api::V1::LikesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    post = Post.find(params[:post_id])
  end
end
