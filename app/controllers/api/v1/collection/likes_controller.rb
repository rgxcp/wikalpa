class Api::V1::Collection::LikesController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
  end
end
