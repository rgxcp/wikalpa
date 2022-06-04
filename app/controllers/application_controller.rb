require "json_web_token"

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  protected

  def parse_auth_id
    token = request.headers.fetch("Authorization", "").split.last
    @auth_id = JsonWebToken.decode(token).first["user_id"]
  rescue JWT::DecodeError
    nil
  end

  def authenticate_request
    id = parse_auth_id
    @auth_user = User.find(id)
  rescue ActiveRecord::RecordNotFound
    unauthorized_response
  end

  def authenticate_admin_request
    id = parse_auth_id
    @auth_admin = User.admin.find(id)
  rescue ActiveRecord::RecordNotFound
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

  def too_many_requests_response
    render json: {
      success: false,
      message: "Too Many Requests"
    },
    status: :too_many_requests
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
