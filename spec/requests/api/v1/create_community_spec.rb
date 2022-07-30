require "rails_helper"

RSpec.describe "Create a community", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { post api_v1_communities_path }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when entity invalid" do
    before do
      user = create(:user)
      community = attributes_for(:community, :invalid)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { community: community }
      post api_v1_communities_path, headers: headers, params: params
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
      community = attributes_for(:community)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { community: community }
      post api_v1_communities_path, headers: headers, params: params
    end

    it "returns created response" do
      expect(response).to have_http_status(:created)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("Created")
      expect(parsed_body["data"]["community"]).to be_present
    end

    it "adds auth user into community member" do
      community = Community.first
      user = User.first
      expect(community.community_member?(user)).to be(true)
    end
  end
end
