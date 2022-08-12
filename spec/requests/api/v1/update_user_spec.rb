require "rails_helper"

RSpec.describe "Update a user", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { patch api_v1_user_path(1) }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when editing someone else account" do
    before do
      user1 = create(:user)
      user2 = create(:user)
      token = login(user2.id)
      headers = { Authorization: "Bearer #{token}" }
      patch api_v1_user_path(user1), headers: headers
    end

    it "returns forbidden response" do
      expect(response).to have_http_status(:forbidden)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Forbidden")
    end
  end

  context "when entity invalid" do
    before do
      user = create(:user)
      entity = attributes_for(:user, :invalid)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { user: entity }
      patch api_v1_user_path(user), headers: headers, params: params
    end

    it "returns unprocessable entity response" do
      expect(response).to have_http_status(:unprocessable_entity)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unprocessable Entity")
      expect(parsed_body["errors"].present?).to be(true)
    end
  end

  context "when entity valid" do
    before do
      user = create(:user)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = {
        user: {
          username: "john_doe",
          password: "87654321"
        }
      }
      patch api_v1_user_path(user), headers: headers, params: params
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["user"]).to be_present
      expect(parsed_body["data"]["user"]["password_digest"]).to be_nil
    end
  end
end
