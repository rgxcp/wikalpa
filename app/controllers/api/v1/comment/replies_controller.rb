class Api::V1::Comment::RepliesController < Api::V1::RepliesController
  before_action :authenticate_request, only: :create

  def index
    comment = Comment.find(params[:comment_id])

    replies = comment.replies

    not_found_response unless replies.size.positive?
  end

  def create
    comment = Comment.find(params[:comment_id])

    reply = comment.replies.build(reply_params)
    reply.user = @auth_user

    if reply.save
      created_response(data: { reply: reply })
    else
      unprocessable_entity_response(errors: reply.errors.messages)
    end
  end
end
