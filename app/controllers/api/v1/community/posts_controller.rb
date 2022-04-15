class Api::V1::Community::PostsController < Api::V1::PostsController
  before_action :authenticate_request, only: :create
  before_action :set_community, only: [:index, :create]

  def index
    posts = @community.posts

    if posts.present?
      ok_response(data: { posts: posts })
    else
      not_found_response
    end
  end

  def create
    return forbidden_response unless @community.community_members.exists?(user: @auth_user)

    post = @community.posts.build(post_params)
    post.user = @auth_user

    if post.save
      created_response(data: { post: post })
    else
      unprocessable_entity_response(errors: post.errors.messages)
    end
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end
end
