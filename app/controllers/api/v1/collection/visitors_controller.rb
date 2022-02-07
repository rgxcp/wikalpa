class Api::V1::Collection::VisitorsController < ApplicationController
  def index
    collection = Collection.find(params[:collection_id])
  end
end
