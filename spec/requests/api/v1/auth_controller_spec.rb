require 'rails_helper'

RSpec.describe Api::V1::AuthController, type: :request do
  describe "POST /auth/register" do
    context "when entity invalid" do
      it "returns 422 status code" do
        user = attributes_for(:user, :invalid)
        post api_v1_auth_register_url, params: { user: user }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
