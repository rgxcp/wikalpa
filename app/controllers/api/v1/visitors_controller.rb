class Api::V1::VisitorsController < ApplicationController
  before_action :set_visitable, only: :index

  def index
    visitors = @visitable.visitors

    if visitors.present?
      ok_response(data: { visitors: visitors })
    else
      not_found_response
    end
  end
end
