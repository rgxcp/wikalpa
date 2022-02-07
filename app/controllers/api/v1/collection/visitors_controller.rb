class Api::V1::Collection::VisitorsController < ApplicationController
  def index
    collection = Collection.find(params[:collection_id])

    visitors = collection.visitors

    not_found_response unless visitors.size.positive?
  end
end
