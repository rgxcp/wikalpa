class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request!, only: :update

  def update
  end
end
