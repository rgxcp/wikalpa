require "rails_helper"

RSpec.describe Api::V1::LikesController, type: :request do
  describe "POST /posts/:post_id/likes" do
    context "when user not logged in" do
      before { post api_v1_post_likes_path(1) }

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
        post api_v1_post_likes_path(0), headers: { Authorization: "Bearer #{token}" }
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

    context "when entity invalid" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        create(:like, user: user, likeable: post)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_post_likes_path(post), headers: { Authorization: "Bearer #{token}" }
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
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_post_likes_path(post), headers: { Authorization: "Bearer #{token}" }
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

      it "returns like data" do
        result = JSON.parse(response.body)
        expect(result["data"]["like"]).not_to be_empty
      end

      it "returns post as the likeable type" do
        result = JSON.parse(response.body)
        expect(result["data"]["like"]["likeable_type"]).to eq("Post")
      end
    end
  end

  describe "POST /comments/:comment_id/likes" do
    context "when user not logged in" do
      before { post api_v1_comment_likes_path(1) }

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

    context "when comment not exists" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_comment_likes_path(0), headers: { Authorization: "Bearer #{token}" }
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

    context "when entity invalid" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        comment = create(:comment, post: post, user: user)
        create(:like, user: user, likeable: comment)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_comment_likes_path(comment), headers: { Authorization: "Bearer #{token}" }
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
        comment = create(:comment, post: post, user: user)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_comment_likes_path(comment), headers: { Authorization: "Bearer #{token}" }
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

      it "returns like data" do
        result = JSON.parse(response.body)
        expect(result["data"]["like"]).not_to be_empty
      end

      it "returns comment as the likeable type" do
        result = JSON.parse(response.body)
        expect(result["data"]["like"]["likeable_type"]).to eq("Comment")
      end
    end
  end

  describe "POST /replies/:reply_id/likes" do
    context "when user not logged in" do
      before { post api_v1_reply_likes_path(1) }

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

    context "when reply not exists" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_reply_likes_path(0), headers: { Authorization: "Bearer #{token}" }
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

    context "when entity invalid" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        comment = create(:comment, post: post, user: user)
        reply = create(:reply, comment: comment, user: user)
        create(:like, user: user, likeable: reply)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_reply_likes_path(reply), headers: { Authorization: "Bearer #{token}" }
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
        comment = create(:comment, post: post, user: user)
        reply = create(:reply, comment: comment, user: user)
        token = JsonWebToken.encode({ id: user.id })
        post api_v1_reply_likes_path(reply), headers: { Authorization: "Bearer #{token}" }
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

      it "returns like data" do
        result = JSON.parse(response.body)
        expect(result["data"]["like"]).not_to be_empty
      end

      it "returns reply as the likeable type" do
        result = JSON.parse(response.body)
        expect(result["data"]["like"]["likeable_type"]).to eq("Reply")
      end
    end
  end

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
