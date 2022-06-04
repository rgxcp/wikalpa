require "rails_helper"

RSpec.describe "Api::V1::User::VisitationsController", type: :request do
  describe "GET /users/:user_id/visitations" do
    context "when user not logged in" do
      before { get api_v1_user_visitations_path(1) }

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

    context "when viewing someone else visitations" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        token = login(user2.id)
        headers = { Authorization: "Bearer #{token}" }
        get api_v1_user_visitations_path(user1), headers: headers
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

    context "when visitations not exist" do
      before do
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        get api_v1_user_visitations_path(user), headers: headers
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

    context "when visitations exist" do
      before do
        user = create(:user)
        community = create(:community)
        create(:visitor, user: user, visitable: community)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        get api_v1_user_visitations_path(user), headers: headers
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

      it "returns visitations data" do
        result = JSON.parse(response.body)
        expect(result["data"]["visitations"]).not_to be_empty
      end
    end
  end
end
