require "rails_helper"

RSpec.describe "Api::V1::User::SessionsController", type: :request do
  describe "GET /users/:user_id/sessions" do
    context "when user not logged in" do
      before { get api_v1_user_sessions_path(1) }

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

    context "when viewing someone else sessions" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        token = login(user2.id)
        headers = { Authorization: "Bearer #{token}" }
        get api_v1_user_sessions_path(user1), headers: headers
      end

      it "returns 403 status code" do
        expect(response).to have_http_status(:forbidden)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(false)
      end

      it "returns forbidden message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Forbidden")
      end
    end

    context "when sessions exist" do
      before do
        user = create(:user)
        create(:session, user: user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        get api_v1_user_sessions_path(user), headers: headers
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

      it "returns sessions data" do
        result = JSON.parse(response.body)
        expect(result["data"]["sessions"]).to be_present
      end
    end
  end
end
