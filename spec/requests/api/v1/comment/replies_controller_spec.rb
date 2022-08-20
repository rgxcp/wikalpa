require "rails_helper"

RSpec.describe "Api::V1::Comment::RepliesController", type: :request do
  describe "POST /comments/:comment_id/replies" do
    context "when user not logged in" do
      before { post api_v1_comment_replies_path(1) }

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
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        post api_v1_comment_replies_path(0), headers: headers
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
        reply = attributes_for(:reply, :invalid)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { reply: reply }
        post api_v1_comment_replies_path(comment), headers: headers, params: params
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
        reply = attributes_for(:reply)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { reply: reply }
        post api_v1_comment_replies_path(comment), headers: headers, params: params
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

      it "returns reply data" do
        result = JSON.parse(response.body)
        expect(result["data"]["reply"]).to be_present
      end
    end

    context "when is_spoiler params set to true" do
      it "returns reply data with true is_spoiler value" do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        comment = create(:comment, post: post, user: user)
        reply = attributes_for(:reply, :spoiler)
        token = login(user.id)
        headers = { Authorization: "Bearer #{token}" }
        params = { reply: reply }
        post api_v1_comment_replies_path(comment), headers: headers, params: params
        result = JSON.parse(response.body)
        expect(result["data"]["reply"]["is_spoiler"]).to be(true)
      end
    end
  end
end
