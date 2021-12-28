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

      it "returns created message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Created")
      end

      it "returns community data" do
        result = JSON.parse(response.body)
        expect(result["data"]["community"]).not_to be_empty
      end

      it "adds auth user into community member" do
        community = Community.first
        user = User.first
        member = Member.exists?(community: community, user: user)
        expect(member).to be_truthy
      end
    end
  end

  describe "PATCH /communities/:id" do
    context "when user not logged in" do
      it "returns 401 status code" do
        patch api_v1_community_path(1)
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when community not exists" do
      it "returns 404 status code" do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        patch api_v1_community_path(0), headers: { Authorization: "Bearer #{token}" }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
