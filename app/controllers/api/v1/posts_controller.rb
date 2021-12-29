class Api::V1::PostsController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    community = Community.find(params[:community_id])
    member = community.members.exists?(user: @auth_user)
    return forbidden_response unless member

    post = community.posts.build(post_params)
    post.user = @auth_user

    unprocessable_entity_response(errors: post.errors.messages) unless post.save
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
