class Api::V1::User::VisitationsController < ApplicationController
  before_action :authenticate_request, only: :index

  def index
  end
end
