require "rails_helper"

RSpec.describe "Api::V1::Comment::DownvotesController", type: :request do
  describe "POST /comments/:comment_id/downvotes" do
    context "when user not logged in" do
      before { post api_v1_comment_downvotes_path(1) }

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

    context "when comment not exists" do
      before do
        user = create(:user)
        token = JsonWebToken.encode({ user_id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        post api_v1_comment_downvotes_path(0), headers: headers
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
        comment = create(:comment, post: post, user: user)
        create(:downvote, user: user, downvoteable: comment)
        token = JsonWebToken.encode({ user_id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        post api_v1_comment_downvotes_path(comment), headers: headers
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
        comment = create(:comment, post: post, user: user)
        token = JsonWebToken.encode({ user_id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        post api_v1_comment_downvotes_path(comment), headers: headers
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

      it "returns downvote data" do
        result = JSON.parse(response.body)
        expect(result["data"]["downvote"]).not_to be_empty
      end

      it "returns comment as the downvoteable type" do
        result = JSON.parse(response.body)
        expect(result["data"]["downvote"]["downvoteable_type"]).to eq("Comment")
      end
    end
  end
end
