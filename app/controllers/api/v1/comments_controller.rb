class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_request, only: [:create, :update]

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

  def update
    comment = Comment.find(params[:id])

    return forbidden_response unless @auth_user.id == comment.user_id

    unprocessable_entity_response(errors: comment.errors.messages) unless comment.update(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
