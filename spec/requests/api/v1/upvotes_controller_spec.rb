require "rails_helper"

RSpec.describe "Api::V1::UpvotesController", type: :request do
  describe "DELETE /upvotes/:id" do
    context "when user not logged in" do
      before { delete api_v1_upvote_path(1) }

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

    context "when upvote not exists" do
      before do
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_upvote_path(0), headers: headers
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

    context "when deleting someone else upvote" do
      before do
        community = create(:community)
        user1 = create(:user)
        user2 = create(:user)
        post = create(:post, community: community, user: user1)
        upvote = create(:upvote, user: user2, upvoteable: post)
        token = login(user1.id)
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_upvote_path(upvote), headers: headers
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

    context "when upvote exists" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        upvote = create(:upvote, user: user, upvoteable: post)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        delete api_v1_upvote_path(upvote), headers: headers
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

      it "returns upvote data" do
        result = JSON.parse(response.body)
        expect(result["data"]["upvote"]).to be_present
      end
    end
  end
end
