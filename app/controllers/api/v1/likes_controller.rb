class Api::V1::LikesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    post = Post.find(params[:post_id])

    like = post.likes.build(user: @auth_user)

    unprocessable_entity_response(errors: like.errors.messages) unless like.save
  end
end
