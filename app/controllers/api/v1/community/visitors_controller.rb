class Api::V1::Community::VisitorsController < Api::V1::VisitorsController
  private

  def set_visitable
    @visitable = Community.find(params[:community_id])
  end
end
