require "rails_helper"

RSpec.describe "Api::V1::User::PostsController", type: :request do
  describe "GET /users/:user_id/posts" do
    context "when user not exists" do
      before { get api_v1_user_posts_path(0) }

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

    context "when posts not exist" do
      before do
        user = create(:user)
        get api_v1_user_posts_path(user)
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

    context "when posts exist" do
      before do
        community = create(:community)
        user = create(:user)
        create(:post, community: community, user: user)
        get api_v1_user_posts_path(user)
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

      it "returns posts data" do
        result = JSON.parse(response.body)
        expect(result["data"]["posts"]).to be_present
      end
    end
  end
end
