require "rails_helper"

RSpec.describe "Api::V1::PostsController", type: :request do
  describe "GET /posts" do
    context "when posts not exist" do
      before { get api_v1_posts_path }

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
        create(:post)
        get api_v1_posts_path
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
        expect(result["data"]["posts"]).not_to be_empty
      end
    end
  end

  describe "GET /posts/:id" do
    context "when post not exists" do
      before { get api_v1_post_path(0) }

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

    context "when post exists" do
      before do
        post = create(:post)
        get api_v1_post_path(post)
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

      it "returns post data" do
        result = JSON.parse(response.body)
        expect(result["data"]["post"]).not_to be_empty
      end
    end

    context "when visiting post while user logged in" do
      it "enqueues VisitorWorker job" do
        auth = create(:user)
        post = create(:post)
        token = JsonWebToken.encode({ id: auth.id })
        headers = { Authorization: "Bearer #{token}" }
        get api_v1_post_path(post), headers: headers
        expect(VisitorWorker).to have_enqueued_sidekiq_job("Post", post.id, auth.id)
      end
    end
  end

  describe "PATCH /posts/:id" do
    context "when user not logged in" do
      before { patch api_v1_post_path(1) }

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
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        patch api_v1_post_path(0), headers: headers
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

    context "when editing someone else post" do
      before do
        community = create(:community)
        user1 = create(:user)
        user2 = create(:user)
        post = create(:post, community: community, user: user2)
        token = JsonWebToken.encode({ id: user1.id })
        headers = { Authorization: "Bearer #{token}" }
        patch api_v1_post_path(post), headers: headers
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

    context "when entity invalid" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        entity = attributes_for(:post, :invalid)
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { post: entity }
        patch api_v1_post_path(post), headers: headers, params: params
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
        entity = attributes_for(:post)
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { post: entity }
        patch api_v1_post_path(post), headers: headers, params: params
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

      it "returns post data" do
        result = JSON.parse(response.body)
        expect(result["data"]["post"]).not_to be_empty
      end
    end

    context "when is_spoiler params set to true" do
      it "returns post data with true is_spoiler value" do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        entity = attributes_for(:post, :spoiler)
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { post: entity }
        patch api_v1_post_path(post), headers: headers, params: params
        result = JSON.parse(response.body)
        expect(result["data"]["post"]["is_spoiler"]).to be(true)
      end
    end
  end
end
