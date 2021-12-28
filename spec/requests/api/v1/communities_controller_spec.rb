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
      it "returns 422 status code" do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        community = attributes_for(:community, :invalid)
        post api_v1_communities_path, headers: { Authorization: "Bearer #{token}" }, params: { community: community }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
