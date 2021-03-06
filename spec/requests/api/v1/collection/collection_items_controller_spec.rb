require "rails_helper"

RSpec.describe "Api::V1::Collection::CollectionItemsController", type: :request do
  describe "GET /collections/:collection_id/collection-items" do
    context "when collection not exists" do
      before { get api_v1_collection_collection_items_path(0) }

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

    context "when collection items exist" do
      before do
        collection = create(:collection)
        get api_v1_collection_collection_items_path(collection)
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

      it "returns collection items data" do
        result = JSON.parse(response.body)
        expect(result["data"]["collection_items"]).to be_present
      end
    end
  end

  describe "POST /collections/:collection_id/collection-items" do
    context "when user not logged in" do
      before { post api_v1_collection_collection_items_path(1) }

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

    context "when collection not exists" do
      before do
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        post api_v1_collection_collection_items_path(0), headers: headers
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

    context "when adding collection item on someone else collection" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        collection = create(:collection, user: user2)
        token = login(user1.id)
        headers = { Authorization: "Bearer #{token}" }
        post api_v1_collection_collection_items_path(collection), headers: headers
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

    context "when entity invalid" do
      before do
        user = create(:user)
        collection = create(:collection, user: user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = {
          collection_item: {
            collectable_type: "",
            collectable_id: nil
          }
        }
        post api_v1_collection_collection_items_path(collection), headers: headers, params: params
      end

      it "returns 422 status code" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(false)
      end

      it "returns unprocessable entity message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Unprocessable Entity")
      end

      it "returns validation errors" do
        result = JSON.parse(response.body)
        expect(result["errors"].present?).to be(true)
      end
    end

    context "when entity valid" do
      before do
        user = create(:user)
        collection = create(:collection, user: user)
        community = create(:community)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = {
          collection_item: {
            collectable_type: "Community",
            collectable_id: community.id
          }
        }
        post api_v1_collection_collection_items_path(collection), headers: headers, params: params
      end

      it "returns 201 status code" do
        expect(response).to have_http_status(:created)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(true)
      end

      it "returns created message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Created")
      end

      it "returns collection item data" do
        result = JSON.parse(response.body)
        expect(result["data"]["collection_item"]).to be_present
      end
    end
  end

  describe "DELETE /collections/:collection_id/collection-items/:id" do
    context "when user not logged in" do
      before { delete api_v1_collection_collection_item_path(1, 1) }

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

    context "when collection not exists" do
      before do
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_collection_collection_item_path(0, 1), headers: headers
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

    context "when deleting collection item on someone else collection" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        collection = create(:collection, user: user2)
        token = login(user1.id)
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_collection_collection_item_path(collection, 1), headers: headers
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

    context "when collection item not exists" do
      before do
        user = create(:user)
        collection = create(:collection, user: user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_collection_collection_item_path(collection, 0), headers: headers
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

    context "when collection item exists" do
      let(:user) { create(:user) }
      let(:collection) { create(:collection, user: user) }

      before do
        collection_item = create(:collection_item, collection: collection)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_collection_collection_item_path(collection, collection_item), headers: headers
      end

      it "enqueues CollectionWorker job" do
        expect(CollectionWorker).to have_enqueued_sidekiq_job(collection.id)
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

      it "returns collection item data" do
        result = JSON.parse(response.body)
        expect(result["data"]["collection_item"]).to be_present
      end
    end
  end
end
