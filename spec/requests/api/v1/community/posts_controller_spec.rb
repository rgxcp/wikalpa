require "rails_helper"

RSpec.describe "Api::V1::Community::PostsController", type: :request do
  describe "GET /communities/:community_id/posts" do
    context "when community not exists" do
      before { get api_v1_community_posts_path(0) }

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
        community = create(:community)
        get api_v1_community_posts_path(community)
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
        get api_v1_community_posts_path(community)
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

  describe "POST /communities/:community_id/posts" do
    context "when user not logged in" do
      before { post api_v1_community_posts_path(1) }

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

    context "when community not exists" do
      before do
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        post api_v1_community_posts_path(0), headers: headers
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

    context "when user not a community member" do
      before do
        community = create(:community)
        user = create(:user)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        post api_v1_community_posts_path(community), headers: headers
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
        create(:community_member, community: community, user: user)
        post = attributes_for(:post, :invalid)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { post: post }
        post api_v1_community_posts_path(community), headers: headers, params: params
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
        create(:community_member, community: community, user: user)
        post = attributes_for(:post)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { post: post }
        post api_v1_community_posts_path(community), headers: headers, params: params
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

      it "returns post data" do
        result = JSON.parse(response.body)
        expect(result["data"]["post"]).to be_present
      end
    end

    context "when is_spoiler params set to true" do
      it "returns post data with true is_spoiler value" do
        community = create(:community)
        user = create(:user)
        create(:community_member, community: community, user: user)
        post = attributes_for(:post, :spoiler)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { post: post }
        post api_v1_community_posts_path(community), headers: headers, params: params
        result = JSON.parse(response.body)
        expect(result["data"]["post"]["is_spoiler"]).to be(true)
      end
    end
  end
end
