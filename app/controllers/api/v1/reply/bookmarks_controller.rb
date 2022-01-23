class Api::V1::Reply::BookmarksController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
  end
end
