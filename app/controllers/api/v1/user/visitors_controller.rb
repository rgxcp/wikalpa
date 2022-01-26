class Api::V1::User::VisitorsController < Api::V1::VisitorsController
  before_action :authenticate_request, only: :index
  before_action :set_visitable, only: :index

  def index
    return forbidden_response unless @auth_id == @visitable.id

    super
  end

  private

  def set_visitable
    @visitable = User.find(params[:user_id])
  end
end
