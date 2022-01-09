class Api::V1::Community::PostsController < Api::V1::PostsController
  before_action :authenticate_request, only: :create

  def index
    community = Community.find(params[:community_id])

    posts = community.posts

    not_found_response unless posts.size.positive?
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
end
