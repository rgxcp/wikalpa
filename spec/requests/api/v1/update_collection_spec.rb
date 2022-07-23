require "rails_helper"

RSpec.describe "Update a collection", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { patch api_v1_collection_path(1) }

    it "returns unauthorized response" do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Unauthorized")
    end
  end

  context "when collection not exists" do
    before do
      user = create(:user)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      patch api_v1_collection_path(0), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when editing someone else collection" do
    before do
      user1 = create(:user)
      user2 = create(:user)
      community = create(:community)
      collection = create(:collection, user: user2, collection_items_attributes: [{ collectable: community }])
      token = login(user1.id)
      headers = { Authorization: "Bearer #{token}" }
      patch api_v1_collection_path(collection), headers: headers
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
      community = create(:community)
      collection = create(:collection, user: user, collection_items_attributes: [{ collectable: community }])
      entity = attributes_for(:collection, :invalid)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { collection: entity }
      patch api_v1_collection_path(collection), headers: headers, params: params
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
      community = create(:community)
      collection = create(:collection, user: user, collection_items_attributes: [{ collectable: community }])
      entity = attributes_for(:collection)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      params = { collection: entity }
      patch api_v1_collection_path(collection), headers: headers, params: params
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["collection"]).to be_present
    end
  end
end
