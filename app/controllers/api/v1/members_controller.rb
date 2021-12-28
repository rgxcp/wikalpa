class Api::V1::MembersController < ApplicationController
  before_action :authenticate_request!, only: :create

  def create
    community = Community.find(params[:community_id])
  end
end
