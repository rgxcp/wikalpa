class Api::V1::User::BookmarksController < ApplicationController
  before_action :authenticate_request, only: :index

  def index
    forbidden_response unless @auth_user.id == params[:user_id].to_i
  end
end
