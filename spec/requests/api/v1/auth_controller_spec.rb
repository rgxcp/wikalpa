require "rails_helper"

RSpec.describe "Api::V1::AuthController", type: :request do
  describe "DELETE /auth/logout" do
    context "when user not logged in" do
      before { delete api_v1_auth_logout_path }

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

    context "when session invalid" do
      before do
        user = create(:user)
        token = login(user.id)
        user.sessions.first.destroy
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_auth_logout_path, headers: headers
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

    context "when session valid" do
      before do
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_auth_logout_path, headers: headers
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

      it "returns session data" do
        result = JSON.parse(response.body)
        expect(result["data"]["session"]).to be_present
      end
    end
  end
end
