require "rails_helper"

RSpec.describe Api::V1::BuddiesController, type: :request do
  describe "POST /users/:user_id/follow" do
    context "when user not logged in" do
      before { post api_v1_user_follow_path(1) }

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

    context "when user not exists" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_user_follow_path(0), headers: { Authorization: "Bearer #{token}" }
      end

      it "returns 404 status code" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end

      it "returns not found message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Not Found")
      end
    end

    context "when entity invalid" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_user_follow_path(user), headers: { Authorization: "Bearer #{token}" }
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
        user1 = create(:user)
        user2 = create(:user)
        token = JsonWebToken.encode({ id: user2.id })
        post api_v1_user_follow_path(user1), headers: { Authorization: "Bearer #{token}" }
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

      it "returns buddy data" do
        result = JSON.parse(response.body)
        expect(result["data"]["buddy"]).not_to be_empty
      end
    end
  end

  describe "DELETE /users/:user_id/unfollow" do
    context "when user not logged in" do
      before { delete api_v1_user_unfollow_path(1) }

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

    context "when user not exists" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        delete api_v1_user_unfollow_path(0), headers: { Authorization: "Bearer #{token}" }
      end

      it "returns 404 status code" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end

      it "returns not found message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Not Found")
      end
    end

    context "when user not a buddy" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        delete api_v1_user_unfollow_path(user), headers: { Authorization: "Bearer #{token}" }
      end

      it "returns 404 status code" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end

      it "returns not found message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Not Found")
      end
    end

    context "when user a buddy" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        create(:buddy, user: user1, buddy: user2)
        token = JsonWebToken.encode({ id: user1.id })
        delete api_v1_user_unfollow_path(user2), headers: { Authorization: "Bearer #{token}" }
      end

      it "returns 200 status code" do
        expect(response).to have_http_status(:ok)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be true
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
