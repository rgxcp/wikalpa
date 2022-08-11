require "rails_helper"

RSpec.describe "Revoke a session", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { delete api_v1_session_path(1) }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when session not exists" do
    before do
      user = create(:user)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_session_path(0), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
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

    it "returns forbidden response" do
      expect(response).to have_http_status(:forbidden)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Forbidden")
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

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["session"]).to be_present
    end
  end
end
