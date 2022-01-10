class Api::V1::User::CommentsController < ApplicationController
  def index
    user = User.find(params[:user_id])

    comments = user.comments

    not_found_response unless comments.size.positive?
  end
end
