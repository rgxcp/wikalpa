class Api::V1::User::CommentsController < ApplicationController
  def index
    user = User.find(params[:user_id])

    comments = user.comments

    if comments.present?
      ok_response(data: { comments: comments })
    else
      not_found_response
    end
  end
end
