class Api::V1::Post::CommentsController < Api::V1::CommentsController
  before_action :authenticate_request, only: :create
  before_action :set_post, only: [:index, :create]

  def index
    comments = @post.comments

    if comments.present?
      ok_response(data: { comments: comments })
    else
      not_found_response
    end
  end

  def create
    comment = @post.comments.build(comment_params)
    comment.user = @auth_user

    if comment.save
      created_response(data: { comment: comment })
    else
      unprocessable_entity_response(errors: comment.errors.messages)
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
