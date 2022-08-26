class Api::V1::UpvotesController < ApplicationController
  before_action :authenticate_request, only: [:create, :destroy]
  before_action :set_upvoteable, only: [:index, :create]

  def index
    upvotes = @upvoteable.upvotes

    if upvotes.present?
      ok_response(data: { upvotes: upvotes })
    else
      not_found_response
    end
  end

  def create
    upvote = @upvoteable.upvotes.build(user: @auth_user)

    if upvote.save
      created_response(data: { upvote: upvote })
    else
      unprocessable_entity_response(errors: upvote.errors.messages)
    end
  end

  def destroy
    upvote = Upvote.find(params[:id])
    return forbidden_response unless current_user?(upvote.user_id)

    upvote.destroy

    ok_response(data: { upvote: upvote })
  end
end
