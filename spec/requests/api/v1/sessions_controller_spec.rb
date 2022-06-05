require "rails_helper"

RSpec.describe "Api::V1::SessionsController", type: :request do
  describe "DELETE /sessions/:id" do
    context "when user not logged in" do
      before { delete api_v1_session_path(1) }

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

    context "when session not exists" do
      before do
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_session_path(0), headers: headers
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

    context "when deleting someone else session" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        session = create(:session, user: user2)
        token = login(user1.id)
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_session_path(session), headers: headers
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

    context "when session exists" do
      before do
        user = create(:user)
        token = login(user.id)
        session = user.sessions.first
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_session_path(session), headers: headers
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
