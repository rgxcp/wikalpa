require "rails_helper"

RSpec.describe "Api::V1::BuddiesController", type: :request do
  describe "DELETE /buddies/:id" do
    context "when user not logged in" do
      before { delete api_v1_buddy_path(1) }

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

    context "when user not a buddy" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ user_id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_buddy_path(0), headers: headers
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

    context "when unfollow someone else buddy" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        buddy = create(:buddy, user: user3, buddy: user2)
        token = JsonWebToken.encode({ user_id: user1.id })
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_buddy_path(buddy), headers: headers
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

    context "when user a buddy" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        buddy = create(:buddy, user: user1, buddy: user2)
        token = JsonWebToken.encode({ user_id: user1.id })
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_buddy_path(buddy), headers: headers
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

      it "returns buddy data" do
        result = JSON.parse(response.body)
        expect(result["data"]["buddy"]).not_to be_empty
      end
    end
  end
end
