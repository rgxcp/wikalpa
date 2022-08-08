require "rails_helper"

RSpec.describe "Get a post by id", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when post not exists" do
    before { get api_v1_post_path(0) }

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when post exists" do
    before do
      post = create(:post)
      get api_v1_post_path(post)
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["post"]).to be_present
    end
  end

  context "when visiting post while user logged in" do
    let(:auth) { create(:user) }
    let(:post) { create(:post) }

    before do
      token = login(auth.id)
      headers = { Authorization: "Bearer #{token}" }
      get api_v1_post_path(post), headers: headers
    end

    it "enqueues VisitorWorker job" do
      expect(VisitorWorker).to have_enqueued_sidekiq_job("Post", post.id, auth.id)
    end
  end
end
