class Api::V1::Collection::VisitorsController < Api::V1::VisitorsController
  private

  def set_visitable
    @visitable = Collection.find(params[:collection_id])
  end
end
