class Api::V1::Post::CommentsController < Api::V1::CommentsController
  before_action :authenticate_request, only: :create

  def create
    post = Post.find(params[:post_id])

    comment = post.comments.build(comment_params)
    comment.user = @auth_user

    if comment.save
      created_response(data: { comment: comment })
    else
      unprocessable_entity_response(errors: comment.errors.messages)
    end
  end
end
