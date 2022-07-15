require "rails_helper"

RSpec.describe "Unfollow a buddy", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { delete api_v1_buddy_path(1) }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when user not a buddy" do
    before do
      user = create(:user)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_buddy_path(0), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when unfollow someone else buddy" do
    before do
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)
      buddy = create(:buddy, user: user3, buddy: user2)
      token = login(user1.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_buddy_path(buddy), headers: headers
    end

    it "returns forbidden response" do
      expect(response).to have_http_status(:forbidden)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Forbidden")
    end
  end

  context "when user a buddy" do
    before do
      user1 = create(:user)
      user2 = create(:user)
      buddy = create(:buddy, user: user1, buddy: user2)
      token = login(user1.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_buddy_path(buddy), headers: headers
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["buddy"]).to be_present
    end
  end
end
