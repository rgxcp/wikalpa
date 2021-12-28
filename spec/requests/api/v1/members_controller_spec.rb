require "rails_helper"

RSpec.describe Api::V1::MembersController, type: :request do
  describe "POST /communities/:community_id/members" do
    context "when user not logged in" do
      it "returns 401 status code" do
        post api_v1_community_members_path(1)
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when community not exists" do
      it "returns 404 status code" do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_community_members_path(0), headers: { Authorization: "Bearer #{token}" }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
