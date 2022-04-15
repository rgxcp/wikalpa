class Api::V1::DownvotesController < ApplicationController
  before_action :authenticate_request, only: [:create, :destroy]
  before_action :set_downvoteable, only: :create

  def create
    downvote = @downvoteable.downvotes.build(user: @auth_user)

    if downvote.save
      created_response(data: { downvote: downvote })
    else
      unprocessable_entity_response(errors: downvote.errors.messages)
    end
  end

  def destroy
    downvote = Downvote.find(params[:id])

    forbidden_response unless @auth_id == downvote.user_id
  end
end
