class Api::V1::BuddiesController < ApplicationController
  before_action :authenticate_request, only: :follow

  def follow
  end
end
