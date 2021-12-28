require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :request do
  describe "PATCH /users/:id" do
    context "when user not logged in" do
      before { patch api_v1_user_path(1) }

      it "returns 401 status code" do
        expect(response).to have_http_status(:unauthorized)
      end

      it "returns falsey success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be_falsey
      end

      it "returns unauthorized message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Unauthorized")
      end
    end

    context "when editing someone else account" do
      it "returns 403 status code" do
        token = JsonWebToken.encode({ id: 2 })
        patch api_v1_user_path(1), headers: { Authorization: "Bearer #{token}" }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
