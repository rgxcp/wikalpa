class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  protected

  def parse_auth_id
    @decoded_token ||= decode_token
    @auth_id = @decoded_token && @decoded_token["user_id"]
  end

  def authenticate_request(as_admin: false)
    parse_auth_id
    parse_session_id
    @auth_user = as_admin ? User.admin.find(@auth_id) : User.find(@auth_id)

    unauthorized_response unless @auth_user.sessions.exists?(@session_id)
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

  private

  def decode_token
    token = request.headers.fetch("Authorization", "").split.last
    @decoded_token = JsonWebToken.decode(token).first
  rescue JWT::DecodeError
    @decoded_token = nil
  end

  def parse_session_id
    @decoded_token ||= decode_token
    @session_id = @decoded_token && @decoded_token["session_id"]
  end
end
