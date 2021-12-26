class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  protected

  def not_found_response
    render json: {
      success: false,
      message: "Not Found"
    },
    status: :not_found
  end
end
