class Api::V1::RepliesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
  end
end
