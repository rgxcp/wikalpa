class Api::V1::Collection::BookmarksController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
  end
end
