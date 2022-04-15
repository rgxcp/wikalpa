require "rails_helper"

RSpec.describe "Api::V1::CollectionsController", type: :request do
  describe "GET /collections" do
    context "when collections not exist" do
      before { get api_v1_collections_path }

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

    context "when collections exist" do
      before do
        create(:collection)
        get api_v1_collections_path
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

      it "returns collections data" do
        result = JSON.parse(response.body)
        expect(result["data"]["collections"]).not_to be_empty
      end
    end
  end

  describe "GET /collections/:id" do
    context "when collection not exists" do
      before { get api_v1_collection_path(0) }

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

    context "when collection exists" do
      before do
        collection = create(:collection)
        get api_v1_collection_path(collection)
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

      it "returns collection data" do
        result = JSON.parse(response.body)
        expect(result["data"]["collection"]).not_to be_empty
      end
    end

    context "when visiting collection while user logged in" do
      it "enqueues visitor worker job in background" do
        auth = create(:user)
        collection = create(:collection)
        token = JsonWebToken.encode({ id: auth.id })
        headers = { Authorization: "Bearer #{token}" }
        expect(VisitorWorker).to receive(:perform_async).with("Collection", collection.id, auth.id)
        get api_v1_collection_path(collection), headers: headers
      end
    end
  end

  describe "POST /collections" do
    context "when user not logged in" do
      before { post api_v1_collections_path }

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

    context "when entity invalid" do
      before do
        user = create(:user)
        collection = attributes_for(:collection, :invalid)
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { collection: collection }
        post api_v1_collections_path, headers: headers, params: params
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
        expect(result["errors"].size).to be_positive
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
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { collection: collection }
        post api_v1_collections_path, headers: headers, params: params
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

      it "returns collection data" do
        result = JSON.parse(response.body)
        expect(result["data"]["collection"]).not_to be_empty
      end
    end
  end

  describe "PATCH /collections/:id" do
    context "when user not logged in" do
      before { patch api_v1_collection_path(1) }

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
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        patch api_v1_collection_path(0), headers: headers
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

    context "when editing someone else collection" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        community = create(:community)
        collection = create(:collection, user: user2, collection_items_attributes: [{ collectable: community }])
        token = JsonWebToken.encode({ id: user1.id })
        headers = { Authorization: "Bearer #{token}" }
        patch api_v1_collection_path(collection), headers: headers
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
        community = create(:community)
        collection = create(:collection, user: user, collection_items_attributes: [{ collectable: community }])
        entity = attributes_for(:collection, :invalid)
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { collection: entity }
        patch api_v1_collection_path(collection), headers: headers, params: params
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
        expect(result["errors"].size).to be_positive
      end
    end

    context "when entity valid" do
      before do
        user = create(:user)
        community = create(:community)
        collection = create(:collection, user: user, collection_items_attributes: [{ collectable: community }])
        entity = attributes_for(:collection)
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { collection: entity }
        patch api_v1_collection_path(collection), headers: headers, params: params
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

      it "returns collection data" do
        result = JSON.parse(response.body)
        expect(result["data"]["collection"]).not_to be_empty
      end
    end
  end
end
