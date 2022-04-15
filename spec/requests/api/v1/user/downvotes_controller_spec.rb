require "rails_helper"

RSpec.describe "Api::V1::User::DownvotesController", type: :request do
  describe "GET /users/:user_id/downvotes" do
    context "when user not logged in" do
      before { get api_v1_user_downvotes_path(1) }

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

    context "when viewing someone else downvotes" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        token = JsonWebToken.encode({ id: user2.id })
        headers = { Authorization: "Bearer #{token}" }
        get api_v1_user_downvotes_path(user1), headers: headers
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
  end
end
