require "rails_helper"

RSpec.describe Api::V1::Post::VisitorsController, type: :request do
  describe "GET /posts/:post_id/visitors" do
    context "when post not exists" do
      before { get api_v1_post_visitors_path(0) }

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

    context "when visitors not exist" do
      before do
        post = create(:post)
        get api_v1_post_visitors_path(post)
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

    context "when visitors exist" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        create(:visitor, user: user, visitable: post)
        get api_v1_post_visitors_path(post)
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

      it "returns visitors data" do
        result = JSON.parse(response.body)
        expect(result["data"]["visitors"]).not_to be_empty
      end
    end
  end
end
