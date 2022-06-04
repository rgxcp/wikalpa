require "rails_helper"

RSpec.describe "Api::V1::BookmarksController", type: :request do
  describe "DELETE /bookmarks/:id" do
    context "when user not logged in" do
      before { delete api_v1_bookmark_path(1) }

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

    context "when bookmark not exists" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ user_id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_bookmark_path(0), headers: headers
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

    context "when deleting someone else bookmark" do
      before do
        community = create(:community)
        user1 = create(:user)
        user2 = create(:user)
        post = create(:post, community: community, user: user1)
        bookmark = create(:bookmark, user: user2, bookmarkable: post)
        token = JsonWebToken.encode({ user_id: user1.id })
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_bookmark_path(bookmark), headers: headers
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

    context "when bookmark exists" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        bookmark = create(:bookmark, user: user, bookmarkable: post)
        token = JsonWebToken.encode({ user_id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_bookmark_path(bookmark), headers: headers
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

      it "returns bookmark data" do
        result = JSON.parse(response.body)
        expect(result["data"]["bookmark"]).not_to be_empty
      end
    end
  end
end
