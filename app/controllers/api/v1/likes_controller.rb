class Api::V1::LikesController < ApplicationController
  before_action :authenticate_request, only: [:create, :destroy]
  before_action :set_likeable, only: :create

  def create
    like = @likeable.likes.build(user: @auth_user)

    if like.save
      created_response(data: { like: like })
    else
      unprocessable_entity_response(errors: like.errors.messages)
    end
  end

  def destroy
    like = Like.find(params[:id])
    return forbidden_response unless @auth_user.id == like.user_id

    like.destroy

    ok_response(data: { like: like })
  end
end