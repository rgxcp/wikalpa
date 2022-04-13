class Api::V1::Post::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
  end
end
