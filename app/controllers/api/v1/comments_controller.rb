class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_request, only: [:create, :update]
  before_action :set_comment, only: [:show, :update]

  def show
    ok_response(data: { comment: @comment })
  end

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
    return forbidden_response unless @auth_user.id == @comment.user_id

    if @comment.update(comment_params)
      ok_response(data: { comment: @comment })
    else
      unprocessable_entity_response(errors: @comment.errors.messages)
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
