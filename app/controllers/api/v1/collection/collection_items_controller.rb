class Api::V1::Collection::CollectionItemsController < ApplicationController
  before_action :authenticate_request, only: :create

  def create
  end
end
