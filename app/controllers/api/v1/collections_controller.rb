class Api::V1::CollectionsController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
  end
end
