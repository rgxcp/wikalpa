class Api::V1::SessionsController < ApplicationController
  before_action :authenticate_request, only: :destroy

  def destroy
  end
end
