class Api::V1::User::VisitorsController < Api::V1::VisitorsController
  private

  def set_visitable
    @visitable = User.find(params[:user_id])
  end
end
