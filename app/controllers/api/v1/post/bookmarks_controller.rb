class Api::V1::Post::BookmarksController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
  end
end
