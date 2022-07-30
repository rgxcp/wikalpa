require "rails_helper"

RSpec.describe "Update a community", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { patch api_v1_community_path(1) }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when community not exists" do
    before do
      user = create(:user)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      patch api_v1_community_path(0), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when user not a community member" do
    before do
      community = create(:community)
      user = create(:user)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      patch api_v1_community_path(community), headers: headers
    end

    it "returns forbidden response" do
      expect(response).to have_http_status(:forbidden)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Forbidden")
    end
  end

  context "when entity invalid" do
    before do
      community = create(:community)
      user = create(:user)
      create(:community_member, community: community, user: user)
      entity = attributes_for(:community, :invalid)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { community: entity }
      patch api_v1_community_path(community), headers: headers, params: params
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
      community = create(:community)
      user = create(:user)
      create(:community_member, community: community, user: user)
      entity = attributes_for(:community)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { community: entity }
      patch api_v1_community_path(community), headers: headers, params: params
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["community"]).to be_present
    end
  end
end
