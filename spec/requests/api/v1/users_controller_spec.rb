require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :request do
  describe "PATCH /users/:id" do
    context "when user not logged in" do
      before { patch api_v1_user_path(1) }

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

    context "when editing someone else account" do
      before do
        token = JsonWebToken.encode({ id: 2 })
        patch api_v1_user_path(1), headers: { Authorization: "Bearer #{token}" }
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

    context "when user not exists" do
      it "returns 404 status code" do
        token = JsonWebToken.encode({ id: 1 })
        patch api_v1_user_path(1), headers: { Authorization: "Bearer #{token}" }
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when entity invalid" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        entity = attributes_for(:user, :invalid)
        patch api_v1_user_path(user), headers: { Authorization: "Bearer #{token}" }, params: { user: entity }
      end

      it "returns 422 status code" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end
    end
  end
end
