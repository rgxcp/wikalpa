class Api::V1::PostsController < ApplicationController
  before_action :authenticate_request, only: [:create, :update]
  before_action :set_post, only: [:show, :update]

  def index
    posts = Post.all

    not_found_response unless posts.size.positive?
  end

  def show
    ok_response(data: { post: @post })
  end

  def create
    community = Community.find(params[:community_id])
    return forbidden_response unless community.members.exists?(user: @auth_user)

    post = community.posts.build(post_params)
    post.user = @auth_user

    if post.save
      created_response(data: { post: post })
    else
      unprocessable_entity_response(errors: post.errors.messages)
    end
  end

  def update
    return forbidden_response unless @auth_user.id == @post.user_id

    if @post.update(post_params)
      ok_response(data: { post: @post })
    else
      unprocessable_entity_response(errors: @post.errors.messages)
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
