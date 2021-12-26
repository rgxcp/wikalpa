class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  protected

  def not_found_response
    render json: {}, status: :not_found
  end
end
