require "rails_helper"

RSpec.describe Api::V1::User::VisitorsController, type: :request do
  describe "GET /users/:user_id/visitors" do
    context "when user not logged in" do
      before { get api_v1_user_visitors_path(1) }

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
        get api_v1_user_visitors_path(0), headers: { Authorization: "Bearer #{token}" }
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

    context "when viewing someone else visitors" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        token = JsonWebToken.encode({ id: user2.id })
        get api_v1_user_visitors_path(user1), headers: { Authorization: "Bearer #{token}" }
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

    context "when visitors not exist" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        get api_v1_user_visitors_path(user), headers: { Authorization: "Bearer #{token}" }
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

    context "when visitors exist" do
      before do
        user = create(:user)
        create(:visitor, user: user, visitable: user)
        token = JsonWebToken.encode({ id: user.id })
        get api_v1_user_visitors_path(user), headers: { Authorization: "Bearer #{token}" }
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

      it "returns visitors data" do
        result = JSON.parse(response.body)
        expect(result["data"]["visitors"]).not_to be_empty
      end
    end
  end
end
