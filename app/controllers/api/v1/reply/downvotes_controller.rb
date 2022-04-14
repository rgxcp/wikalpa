class Api::V1::Reply::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
  end
end
