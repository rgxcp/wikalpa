require "rails_helper"

RSpec.describe "Api::V1::Post::CommentsController", type: :request do
  describe "GET /posts/:post_id/comments" do
    context "when post not exists" do
      before { get api_v1_post_comments_path(0) }

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

    context "when comments not exist" do
      before do
        post = create(:post)
        get api_v1_post_comments_path(post)
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

    context "when comments exist" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        create(:comment, post: post, user: user)
        get api_v1_post_comments_path(post)
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

      it "returns comments data" do
        result = JSON.parse(response.body)
        expect(result["data"]["comments"]).to be_present
      end
    end
  end

  describe "POST /posts/:post_id/comments" do
    context "when user not logged in" do
      before { post api_v1_post_comments_path(1) }

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

    context "when post not exists" do
      before do
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        post api_v1_post_comments_path(0), headers: headers
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
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        comment = attributes_for(:comment, :invalid)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { comment: comment }
        post api_v1_post_comments_path(post), headers: headers, params: params
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
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        comment = attributes_for(:comment)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { comment: comment }
        post api_v1_post_comments_path(post), headers: headers, params: params
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

      it "returns comment data" do
        result = JSON.parse(response.body)
        expect(result["data"]["comment"]).to be_present
      end
    end

    context "when is_spoiler params set to true" do
      it "returns comment data with true is_spoiler value" do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        comment = attributes_for(:comment, :spoiler)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { comment: comment }
        post api_v1_post_comments_path(post), headers: headers, params: params
        result = JSON.parse(response.body)
        expect(result["data"]["comment"]["is_spoiler"]).to be(true)
      end
    end
  end
end
