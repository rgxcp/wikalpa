class Api::V1::CommunitiesController < ApplicationController
  before_action :authenticate_request!, only: :create

  def create
  end
end
