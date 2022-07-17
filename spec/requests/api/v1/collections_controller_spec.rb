require "rails_helper"

RSpec.describe "Api::V1::CollectionsController", type: :request do
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
        token = login(user.id)
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
        token = login(user1.id)
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
        token = login(user.id)
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
        expect(result["errors"].present?).to be(true)
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
        expect(result["data"]["collection"]).to be_present
      end
    end
  end
end
