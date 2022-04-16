require "rails_helper"

RSpec.describe "Api::V1::CommentsController", type: :request do
  describe "GET /comments/:id" do
    context "when comment not exists" do
      before { get api_v1_comment_path(0) }

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

    context "when comment exists" do
      before do
        comment = create(:comment)
        get api_v1_comment_path(comment)
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

      it "returns comment data" do
        result = JSON.parse(response.body)
        expect(result["data"]["comment"]).not_to be_empty
      end
    end
  end

  describe "PATCH /comments/:id" do
    context "when user not logged in" do
      before { patch api_v1_comment_path(1) }

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
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        patch api_v1_comment_path(0), headers: headers
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

    context "when editing someone else comment" do
      before do
        community = create(:community)
        user1 = create(:user)
        user2 = create(:user)
        post = create(:post, community: community, user: user1)
        comment = create(:comment, post: post, user: user2)
        token = JsonWebToken.encode({ id: user1.id })
        headers = { Authorization: "Bearer #{token}" }
        patch api_v1_comment_path(comment), headers: headers
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
        comment = create(:comment, post: post, user: user)
        entity = attributes_for(:comment, :invalid)
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { comment: entity }
        patch api_v1_comment_path(comment), headers: headers, params: params
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
        expect(result["errors"].size).to be_positive
      end
    end

    context "when entity valid" do
      before do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        comment = create(:comment, post: post, user: user)
        entity = attributes_for(:comment)
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { comment: entity }
        patch api_v1_comment_path(comment), headers: headers, params: params
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

      it "returns comment data" do
        result = JSON.parse(response.body)
        expect(result["data"]["comment"]).not_to be_empty
      end
    end

    context "when is_spoiler params set to true" do
      it "returns comment data with true is_spoiler value" do
        community = create(:community)
        user = create(:user)
        post = create(:post, community: community, user: user)
        comment = create(:comment, post: post, user: user)
        entity = attributes_for(:comment, :spoiler)
        token = JsonWebToken.encode({ id: user.id })
        headers = { Authorization: "Bearer #{token}" }
        params = { comment: entity }
        patch api_v1_comment_path(comment), headers: headers, params: params
        result = JSON.parse(response.body)
        expect(result["data"]["comment"]["is_spoiler"]).to be(true)
      end
    end
  end
end
