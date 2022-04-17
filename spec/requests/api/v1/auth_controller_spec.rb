require "rails_helper"

RSpec.describe "Api::V1::AuthController", type: :request do
  describe "POST /auth/register" do
    context "when entity invalid" do
      before do
        user = attributes_for(:user, :invalid)
        params = { user: user }
        post api_v1_auth_register_path, params: params
      end

      it "returns 422 status code" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(false)
      end

      it "returns unprocessable entity message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Unprocessable Entity")
      end

      it "returns validation errors" do
        result = JSON.parse(response.body)
        expect(result["errors"].present?).to be(true)
      end
    end

    context "when entity valid" do
      before do
        user = attributes_for(:user)
        params = { user: user }
        post api_v1_auth_register_path, params: params
      end

      it "returns 201 status code" do
        expect(response).to have_http_status(:created)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(true)
      end

      it "returns created message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Created")
      end

      it "returns user data" do
        result = JSON.parse(response.body)
        expect(result["data"]["user"]).not_to be_empty
      end

      it "excludes password digest on user data" do
        result = JSON.parse(response.body)
        expect(result["data"]["user"]["password_digest"]).to be_nil
      end

      it "generates token data" do
        result = JSON.parse(response.body)
        expect(result["data"]["token"]).not_to be_empty
      end
    end
  end

  describe "POST /auth/login" do
    context "when username not exists" do
      before do
        user = attributes_for(:user)
        post api_v1_auth_login_path, params: user
      end

      it "returns 404 status code" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(false)
      end

      it "returns not found message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Not Found")
      end
    end

    context "when password not valid" do
      before do
        user = create(:user)
        params = { username: user.username, password: "!#{user.password}!" }
        post api_v1_auth_login_path, params: params
      end

      it "returns 401 status code" do
        expect(response).to have_http_status(:unauthorized)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(false)
      end

      it "returns unauthorized message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Unauthorized")
      end
    end

    context "when password valid" do
      before do
        user = create(:user)
        params = { username: user.username, password: user.password }
        post api_v1_auth_login_path, params: params
      end

      it "returns 200 status code" do
        expect(response).to have_http_status(:ok)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(true)
      end

      it "returns ok message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("OK")
      end

      it "returns user data" do
        result = JSON.parse(response.body)
        expect(result["data"]["user"]).not_to be_empty
      end

      it "excludes password digest on user data" do
        result = JSON.parse(response.body)
        expect(result["data"]["user"]["password_digest"]).to be_nil
      end

      it "generates token data" do
        result = JSON.parse(response.body)
        expect(result["data"]["token"]).not_to be_empty
      end
    end
  end
end
