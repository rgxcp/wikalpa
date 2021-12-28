require "json_web_token"

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  protected

  def authenticate_request!
    token = request.headers.fetch("Authorization", "").split.last
    id = JsonWebToken.decode(token).first["id"]
    @auth_user = User.find(id)
  rescue JWT::DecodeError, ActiveRecord::RecordNotFound
    unauthorized_response
  end

  def created_response(data:, except: nil)
    render json: {
      success: true,
      message: "Created",
      data: data
    },
    status: :created,
    except: except
  end

  def forbidden_response
    render json: {
      success: false,
      message: "Forbidden"
    },
    status: :forbidden
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
