class Api::V1::Comment::RepliesController < Api::V1::RepliesController
  before_action :authenticate_request, only: :create
  before_action :set_comment, only: [:index, :create]

  def index
    replies = @comment.replies

    if replies.present?
      ok_response(data: { replies: replies })
    else
      not_found_response
    end
  end

  def create
    reply = @comment.replies.build(reply_params)
    reply.user = @auth_user

    if reply.save
      created_response(data: { reply: reply })
    else
      unprocessable_entity_response(errors: reply.errors.messages)
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
