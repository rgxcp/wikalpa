class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  protected

  def created_response(data:, except: nil)
    render json: {
      success: true,
      message: "Created",
      data: data
    },
    status: :created,
    except: except
  end

  def not_found_response
    render json: {
      success: false,
      message: "Not Found"
    },
    status: :not_found
  end

  def ok_response(data:, except: nil)
    render json: {
      success: true,
      message: "OK",
      data: data
    },
    status: :ok,
    except: except
  end

  def unauthorized_response
    render json: {
      success: false,
      message: "Unauthorized"
    },
    status: :unauthorized
  end

  def unprocessable_entity_response(errors:)
    render json: {
      success: false,
      message: "Unprocessable Entity",
      errors: errors
    },
    status: :unprocessable_entity
  end
end
