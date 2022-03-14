class Api::V1::User::CollectionsController < ApplicationController
  def index
    user = User.find(params[:user_id])

    collections = user.collections

    not_found_response unless collections.size.positive?
  end
end
