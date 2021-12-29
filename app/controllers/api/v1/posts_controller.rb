class Api::V1::PostsController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
    community = Community.find(params[:community_id])
  end
end
