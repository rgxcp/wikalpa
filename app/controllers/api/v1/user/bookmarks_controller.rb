class Api::V1::User::BookmarksController < ApplicationController
  before_action :authenticate_request, only: :index

  def index
    return forbidden_response unless @auth_user.id == params[:user_id].to_i

    bookmarks = @auth_user.bookmarks

    not_found_response unless bookmarks.size.positive?
  end
end
