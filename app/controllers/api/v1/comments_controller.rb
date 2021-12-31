class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    post = Post.find(params[:post_id])

    comment = post.comments.build(comment_params)
    comment.user = @auth_user

    unprocessable_entity_response(errors: comment.errors.messages) unless comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
