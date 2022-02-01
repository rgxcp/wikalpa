require "rails_helper"

RSpec.describe Api::V1::User::BookmarksController, type: :request do
  describe "GET /users/:user_id/bookmarks" do
    context "when user not logged in" do
      before { get api_v1_user_bookmarks_path(1) }

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

    context "when viewing someone else bookmarks" do
      before do
        user1 = create(:user)
        user2 = create(:user)
        token = JsonWebToken.encode({ id: user2.id })
        headers = { Authorization: "Bearer #{token}" }
        get api_v1_user_bookmarks_path(user1), headers: headers
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

    context "when bookmarks not exist" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        get api_v1_user_bookmarks_path(user), headers: headers
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

    context "when bookmarks exist" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        create(:bookmark, user: user, bookmarkable: post)
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        get api_v1_user_bookmarks_path(user), headers: headers
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

      it "returns bookmarks data" do
        result = JSON.parse(response.body)
        expect(result["data"]["bookmarks"]).not_to be_empty
      end
    end
  end
end
