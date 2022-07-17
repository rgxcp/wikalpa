require "rails_helper"

RSpec.describe "Create a collection", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { post api_v1_collections_path }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when entity invalid" do
    before do
      user = create(:user)
      collection = attributes_for(:collection, :invalid)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { collection: collection }
      post api_v1_collections_path, headers: headers, params: params
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
      collection = attributes_for(:collection, collection_items_attributes: [{
        collectable_type: "Community",
        collectable_id: community.id
      }])
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { collection: collection }
      post api_v1_collections_path, headers: headers, params: params
    end

    it "returns created response" do
      expect(response).to have_http_status(:created)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("Created")
      expect(parsed_body["data"]["collection"]).to be_present
    end
  end
end
