class Api::V1::PostsController < ApplicationController
  before_action :parse_auth_id, only: :show
  before_action :authenticate_request, only: :update
  before_action :set_post, only: [:show, :update]

  def index
    posts = Post.all

    if posts.present?
      ok_response(data: { posts: posts })
    else
      not_found_response
    end
  end

  def show
    VisitorWorker.perform_async("Post", @post.id, @auth_id) if @auth_id

    ok_response(data: { post: @post })
  end

  def update
    return forbidden_response unless current_user?(@post.user_id)

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
    params.require(:post).permit(:body, :is_spoiler)
  end
end
