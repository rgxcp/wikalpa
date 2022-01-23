require "rails_helper"

RSpec.describe Api::V1::LikesController, type: :request do
  describe "DELETE /likes/:id" do
    context "when user not logged in" do
      before { delete api_v1_like_path(1) }

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

    context "when like not exists" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        delete api_v1_like_path(0), headers: { Authorization: "Bearer #{token}" }
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

    context "when deleting someone else like" do
      before do
        community = create(:community)
        user1 = create(:user)
        user2 = create(:user)
        post = create(:post, community: community, user: user1)
        like = create(:like, user: user2, likeable: post)
        token = JsonWebToken.encode({ id: user1.id })
        delete api_v1_like_path(like), headers: { Authorization: "Bearer #{token}" }
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

    context "when like exists" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        like = create(:like, user: user, likeable: post)
        token = JsonWebToken.encode({ id: user.id })
        delete api_v1_like_path(like), headers: { Authorization: "Bearer #{token}" }
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

      it "returns like data" do
        result = JSON.parse(response.body)
        expect(result["data"]["like"]).not_to be_empty
      end
    end
  end
end
