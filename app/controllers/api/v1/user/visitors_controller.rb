class Api::V1::User::VisitorsController < Api::V1::VisitorsController
  before_action :authenticate_request, only: :index
  before_action :set_visitable, only: :index

  private

  def set_visitable
    @visitable = User.find(params[:user_id])
  end
end
