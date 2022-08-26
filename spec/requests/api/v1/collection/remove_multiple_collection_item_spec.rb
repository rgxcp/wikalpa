require "rails_helper"

RSpec.describe "Remove multiple collection item inside a collection", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { delete api_v1_collection_collection_items_path(1) }

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
      delete api_v1_collection_collection_items_path(0), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when deleting multiple collection item on someone else collection" do
    before do
      user1 = create(:user)
      user2 = create(:user)
      collection = create(:collection, user: user2)
      token = login(user1.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_collection_collection_items_path(collection), headers: headers
    end

    it "returns forbidden response" do
      expect(response).to have_http_status(:forbidden)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Forbidden")
    end
  end

  [
    { ids: nil, title: "nil" },
    { ids: "", title: "empty string" },
    { ids: "1, 2, 3", title: "string" }
  ].each do |item|
    context "when ids query params is #{item[:title]}" do
      before do
        user = create(:user)
        collection = create(:collection, user: user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_collection_collection_items_path(collection, params: { ids: item[:ids] }), headers: headers
      end

      it "returns bad request response" do
        expect(response).to have_http_status(:bad_request)
        expect(parsed_body["success"]).to be(false)
        expect(parsed_body["message"]).to eq("Bad Request")
        expect(parsed_body["errors"].present?).to be(true)
      end
    end
  end

  context "when ids query params is not array of integers" do
    before do
      user = create(:user)
      collection = create(:collection, user: user)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_collection_collection_items_path(collection, params: { ids: ["1.2", "A", "@"] }), headers: headers
    end

    it "returns bad request response" do
      expect(response).to have_http_status(:bad_request)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Bad Request")
      expect(parsed_body["errors"].present?).to be(true)
    end
  end

  context "when ids query params is array of integers" do
    let(:user) { create(:user) }
    let(:collection) { create(:collection, user: user) }

    before do
      create(:collection_item, id: 1, collection: collection)
      create(:collection_item, id: 2, collection: collection)
      create(:collection_item, id: 3, collection: collection)
      create(:collection_item, id: 4, collection: collection)
      create(:collection_item, id: 5, collection: collection)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_collection_collection_items_path(collection, params: { ids: ["1", "2", "5"] }), headers: headers
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["collection_items"]).to be_present
      expect(CollectionItem.exists?(1)).to be(false)
      expect(CollectionItem.exists?(2)).to be(false)
      expect(CollectionItem.exists?(3)).to be(true)
      expect(CollectionItem.exists?(4)).to be(true)
      expect(CollectionItem.exists?(5)).to be(false)
    end

    it "enqueues CollectionWorker job" do
      expect(CollectionWorker).to have_enqueued_sidekiq_job(collection.id)
    end
  end
end
