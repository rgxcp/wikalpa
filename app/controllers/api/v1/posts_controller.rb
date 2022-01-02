class Api::V1::PostsController < ApplicationController
  before_action :authenticate_request, only: [:create, :update]

  def create
    community = Community.find(params[:community_id])
    return forbidden_response unless community.members.exists?(user: @auth_user)

    post = community.posts.new(post_params)
    post.user = @auth_user

    if post.save
      created_response(data: { post: post })
    else
      unprocessable_entity_response(errors: post.errors.messages)
    end
  end

  def update
    post = Post.find(params[:id])
    return forbidden_response unless @auth_user.id == post.user_id

    if post.update(post_params)
      ok_response(data: { post: post })
    else
      unprocessable_entity_response(errors: post.errors.messages)
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
