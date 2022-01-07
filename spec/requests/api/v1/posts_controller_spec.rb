require "rails_helper"

RSpec.describe Api::V1::PostsController, type: :request do
  describe "GET /posts" do
    context "when posts not exist" do
      before { get api_v1_posts_path }

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
        expect(result["success"]).to be true
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
        expect(result["success"]).to be false
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
        expect(result["success"]).to be true
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
  end

  describe "POST /communities/:community_id/posts" do
    context "when user not logged in" do
      before { post api_v1_community_posts_path(1) }

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

    context "when community not exists" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_community_posts_path(0), headers: { Authorization: "Bearer #{token}" }
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

    context "when user not a community member" do
      before do
        community = create(:community)
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_community_posts_path(community), headers: { Authorization: "Bearer #{token}" }
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

    context "when entity invalid" do
      before do
        community = create(:community)
        user = create(:user)
        create(:member, community: community, user: user)
        post = attributes_for(:post, :invalid)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_community_posts_path(community), headers: { Authorization: "Bearer #{token}" }, params: {
          post: post
        }
      end

      it "returns 422 status code" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end

      it "returns unprocessable entity message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Unprocessable Entity")
      end

      it "returns validation errors" do
        result = JSON.parse(response.body)
        expect(result["errors"].size).to be_positive
      end
    end

    context "when entity valid" do
      before do
        community = create(:community)
        user = create(:user)
        create(:member, community: community, user: user)
        post = attributes_for(:post)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_community_posts_path(community), headers: { Authorization: "Bearer #{token}" }, params: {
          post: post
        }
      end

      it "returns 201 status code" do
        expect(response).to have_http_status(:created)
      end

      it "returns true success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be true
      end

      it "returns created message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Created")
      end

      it "returns post data" do
        result = JSON.parse(response.body)
        expect(result["data"]["post"]).not_to be_empty
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
        expect(result["success"]).to be false
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
        patch api_v1_post_path(0), headers: { Authorization: "Bearer #{token}" }
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

    context "when editing someone else post" do
      before do
        community = create(:community)
        user1 = create(:user)
        user2 = create(:user)
        post = create(:post, community: community, user: user2)
        token = JsonWebToken.encode({ id: user1.id })
        patch api_v1_post_path(post), headers: { Authorization: "Bearer #{token}" }
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

    context "when entity invalid" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        entity = attributes_for(:post, :invalid)
        token = JsonWebToken.encode({ id: user.id })
        patch api_v1_post_path(post), headers: { Authorization: "Bearer #{token}" }, params: {
          post: entity
        }
      end

      it "returns 422 status code" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end

      it "returns unprocessable entity message body" do
        result = JSON.parse(response.body)
        expect(result["message"]).to eq("Unprocessable Entity")
      end

      it "returns validation errors" do
        result = JSON.parse(response.body)
        expect(result["errors"].size).to be_positive
      end
    end

    context "when entity valid" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        entity = attributes_for(:post)
        token = JsonWebToken.encode({ id: user.id })
        patch api_v1_post_path(post), headers: { Authorization: "Bearer #{token}" }, params: {
          post: entity
        }
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

      it "returns post data" do
        result = JSON.parse(response.body)
        expect(result["data"]["post"]).not_to be_empty
      end
    end
  end
end
