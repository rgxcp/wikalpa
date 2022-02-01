require "rails_helper"

RSpec.describe Api::V1::Collection::CollectionItemsController, type: :request do
  describe "POST /collections/:collection_id/collection-items" do
    context "when user not logged in" do
      before { post api_v1_collection_collection_items_path(1) }

      it "returns 401 status code" do
        expect(response).to have_http_status(:unauthorized)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
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
        post api_v1_collection_collection_items_path(0), headers: { Authorization: "Bearer #{token}" }
      end

      it "returns 404 status code" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
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
        token = JsonWebToken.encode({ id: user1.id })
        post api_v1_collection_collection_items_path(collection), headers: { Authorization: "Bearer #{token}" }
      end

      it "returns 403 status code" do
        expect(response).to have_http_status(:forbidden)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
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
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_collection_collection_items_path(collection), headers: { Authorization: "Bearer #{token}" }, params: {
          collection_item: {
            collectable_type: "",
            collectable_id: nil
          }
        }
      end

      it "returns 422 status code" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
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
        collection = create(:collection, user: user)
        community = create(:community)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_collection_collection_items_path(collection), headers: { Authorization: "Bearer #{token}" }, params: {
          collection_item: {
            collectable_type: "Community",
            collectable_id: community.id
          }
        }
      end

      it "returns 201 status code" do
        expect(response).to have_http_status(:created)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be true
      end

      it "returns created message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Created")
      end

      it "returns collection item data" do
        result = JSON.parse(response.body)
        expect(result["data"]["collection_item"]).not_to be_empty
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
        expect(result["success"]).to be false
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
        delete api_v1_collection_collection_item_path(0, 1), headers: { Authorization: "Bearer #{token}" }
      end

      it "returns 404 status code" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end

      it "returns not found message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Not Found")
      end
    end
  end
end
