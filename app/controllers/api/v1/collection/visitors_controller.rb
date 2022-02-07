class Api::V1::Collection::VisitorsController < ApplicationController
  def index
    collection = Collection.find(params[:collection_id])

    visitors = collection.visitors

    if visitors.size.positive?
      ok_response(data: { visitors: visitors })
    else
      not_found_response
    end
  end
end
