require "rails_helper"

RSpec.describe "Api::V1::UsersController", type: :request do
  describe "PATCH /users/:id" do
    context "when user not logged in" do
      before { patch api_v1_user_path(1) }

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

    context "when editing someone else account" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        token = login(user2.id)
        headers = { Authorization: "Bearer #{token}" }
        patch api_v1_user_path(user1), headers: headers
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
        entity = attributes_for(:user, :invalid)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { user: entity }
        patch api_v1_user_path(user), headers: headers, params: params
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
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = {
          user: {
            username: "john_doe",
            password: "87654321"
          }
        }
        patch api_v1_user_path(user), headers: headers, params: params
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

      it "returns user data" do
        result = JSON.parse(response.body)
        expect(result["data"]["user"]).to be_present
      end

      it "excludes password digest on user data" do
        result = JSON.parse(response.body)
        expect(result["data"]["user"]["password_digest"]).to be_nil
      end
    end
  end
end
