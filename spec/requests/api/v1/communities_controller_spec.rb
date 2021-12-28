require "rails_helper"

RSpec.describe Api::V1::CommunitiesController, type: :request do
  describe "POST /communities" do
    context "when user not logged in" do
      it "returns 401 status code" do
        post api_v1_communities_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when entity invalid" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        community = attributes_for(:community, :invalid)
        post api_v1_communities_path, headers: { Authorization: "Bearer #{token}" }, params: { community: community }
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
        token = JsonWebToken.encode({ id: user.id })
        community = attributes_for(:community)
        post api_v1_communities_path, headers: { Authorization: "Bearer #{token}" }, params: { community: community }
      end

      it "returns 201 status code" do
        expect(response).to have_http_status(:created)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be true
      end
    end
  end
end
