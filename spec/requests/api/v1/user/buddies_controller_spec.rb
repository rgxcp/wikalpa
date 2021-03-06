require "rails_helper"

RSpec.describe "Api::V1::User::BuddiesController", type: :request do
  describe "GET /users/:user_id/buddies" do
    context "when user not exists" do
      before { get api_v1_user_buddies_path(0) }

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

    context "when buddies not exist" do
      before do
        user = create(:user)
        get api_v1_user_buddies_path(user)
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

    context "when buddies exist" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        create(:buddy, user: user1, buddy: user2)
        get api_v1_user_buddies_path(user1)
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

      it "returns buddies data" do
        result = JSON.parse(response.body)
        expect(result["data"]["buddies"]).to be_present
      end
    end
  end

  describe "POST /users/:user_id/buddies" do
    context "when user not logged in" do
      before { post api_v1_user_buddies_path(1) }

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

    context "when user not exists" do
      before do
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        post api_v1_user_buddies_path(0), headers: headers
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

    context "when entity invalid" do
      before do
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        post api_v1_user_buddies_path(user), headers: headers
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
        user1 = create(:user)
        user2 = create(:user)
        token = login(user2.id)
        headers = { Authorization: "Bearer #{token}" }
        post api_v1_user_buddies_path(user1), headers: headers
      end

      it "returns 201 status code" do
        expect(response).to have_http_status(:created)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be(true)
      end

      it "returns created message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Created")
      end

      it "returns buddy data" do
        result = JSON.parse(response.body)
        expect(result["data"]["buddy"]).to be_present
      end
    end
  end
end
