require "rails_helper"

RSpec.describe "Api::V1::Community::CollectionsController", type: :request do
  describe "GET /communities/:community_id/collections" do
    context "when community not exists" do
      before { get api_v1_community_collections_path(0) }

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

    context "when collections not exist" do
      before do
        community = create(:community)
        get api_v1_community_collections_path(community)
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

    context "when collections exist" do
      before do
        community = create(:community)
        create(:collection, collection_items_attributes: [{ collectable: community }])
        get api_v1_community_collections_path(community)
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
        expect(result["data"]["collections"]).to be_present
      end
    end
  end
end
