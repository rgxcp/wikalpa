class Api::V1::Collection::DownvotesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
  end
end
