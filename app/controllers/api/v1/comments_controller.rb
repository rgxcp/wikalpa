class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
  end
end
