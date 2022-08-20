require "rails_helper"

RSpec.describe "Get all upvoters of a comment", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when comment not exists" do
    before { get api_v1_comment_upvotes_path(0) }

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when upvotes not exist" do
    before do
      comment = create(:comment)
      get api_v1_comment_upvotes_path(comment)
    end

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when upvotes exist" do
    before do
      community = create(:community)
      user = create(:user)
      post = create(:post, community: community, user: user)
      comment = create(:comment, post: post, user: user)
      create(:upvote, user: user, upvoteable: comment)
      get api_v1_comment_upvotes_path(comment)
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["upvotes"]).to be_present
    end
  end
end
