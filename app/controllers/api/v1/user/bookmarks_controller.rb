class Api::V1::User::BookmarksController < ApplicationController
  before_action :authenticate_request, only: :index

  def index
    return forbidden_response unless current_user?(params[:user_id].to_i)

    bookmarks = @auth_user.bookmarks

    if bookmarks.present?
      ok_response(data: { bookmarks: bookmarks })
    else
      not_found_response
    end
  end
end
