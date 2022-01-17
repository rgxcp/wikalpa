class Api::V1::Post::VisitorsController < Api::V1::VisitorsController
  private

  def set_visitable
    @visitable = Post.find(params[:post_id])
  end
end
