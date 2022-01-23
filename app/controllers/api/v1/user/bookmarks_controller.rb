class Api::V1::User::BookmarksController < ApplicationController
  before_action :authenticate_request, only: :index

  def index
  end
end
