require "rails_helper"

RSpec.describe Api::V1::PostsController, type: :request do
  describe "POST /communities/:community_id/posts" do
    context "when user not logged in" do
      it "returns 401 status code" do
        post api_v1_community_posts_path(1)
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when community not exists" do
      it "returns 404 status code" do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_community_posts_path(0), headers: { Authorization: "Bearer #{token}" }
        expect(response).to have_http_status(:not_found)
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
        member = create(:member)
        token = JsonWebToken.encode({ id: member.user.id })
        post = attributes_for(:post, :invalid)
        post api_v1_community_posts_path(member.community), headers: { Authorization: "Bearer #{token}" }, params: {
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
        member = create(:member)
        token = JsonWebToken.encode({ id: member.user.id })
        post = attributes_for(:post)
        post api_v1_community_posts_path(member.community), headers: { Authorization: "Bearer #{token}" }, params: {
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

  describe "PATCH /communities/:community_id/posts/:id" do
    context "when user not logged in" do
      it "returns 401 status code" do
        patch api_v1_community_post_path(1, 1)
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when community not exists" do
      it "returns 404 status code" do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        patch api_v1_community_post_path(0, 1), headers: { Authorization: "Bearer #{token}" }
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when user not a community member" do
      before do
        community = create(:community)
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        patch api_v1_community_post_path(community, 1), headers: { Authorization: "Bearer #{token}" }
      end

      it "returns 403 status code" do
        expect(response).to have_http_status(:forbidden)
      end

      it "returns false success body" do
        result = JSON.parse(response.body)
        expect(result["success"]).to be false
      end
    end
  end
end
