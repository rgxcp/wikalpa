require "rails_helper"

RSpec.describe Api::V1::CollectionsController, type: :request do
  describe "POST /collections" do
    context "when user not logged in" do
      before { post api_v1_collections_path }

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

    context "when entity invalid" do
      before do
        user = create(:user)
        collection = attributes_for(:collection, :invalid)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_collections_path, headers: { Authorization: "Bearer #{token}" }, params: { collection: collection }
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
  end
end
