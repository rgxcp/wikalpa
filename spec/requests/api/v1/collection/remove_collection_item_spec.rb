require "rails_helper"

RSpec.describe "Remove a collection item inside a collection", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when user not logged in" do
    before { delete api_v1_collection_collection_item_path(1, 1) }

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
      delete api_v1_collection_collection_item_path(0, 1), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when deleting collection item on someone else collection" do
    before do
      user1 = create(:user)
      user2 = create(:user)
      collection = create(:collection, user: user2)
      token = login(user1.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_collection_collection_item_path(collection, 1), headers: headers
    end

    it "returns forbidden response" do
      expect(response).to have_http_status(:forbidden)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Forbidden")
    end
  end

  context "when collection item not exists" do
    before do
      user = create(:user)
      collection = create(:collection, user: user)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_collection_collection_item_path(collection, 0), headers: headers
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when collection item exists" do
    let(:user) { create(:user) }
    let(:collection) { create(:collection, user: user) }

    before do
      collection_item = create(:collection_item, collection: collection)
      token = login(user.id)
      headers = { Authorization: "Bearer #{token}" }
      delete api_v1_collection_collection_item_path(collection, collection_item), headers: headers
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["collection_item"]).to be_present
    end

    it "enqueues CollectionWorker job" do
      expect(CollectionWorker).to have_enqueued_sidekiq_job(collection.id)
    end
  end
end
