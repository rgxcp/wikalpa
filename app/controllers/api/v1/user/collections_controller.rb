class Api::V1::User::CollectionsController < ApplicationController
  def index
    user = User.find(params[:user_id])

    collections = user.collections

    if collections.present?
      ok_response(data: { collections: collections })
    else
      not_found_response
    end
  end
end
