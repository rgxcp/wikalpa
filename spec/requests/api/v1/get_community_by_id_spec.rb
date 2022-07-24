require "rails_helper"

RSpec.describe "Get a community by id", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when community not exists" do
    before { get api_v1_community_path(0) }

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when community exists" do
    before do
      community = create(:community)
      get api_v1_community_path(community)
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["community"]).to be_present
    end
  end

  context "when visiting community while user logged in" do
    let(:auth) { create(:user) }
    let(:community) { create(:community) }

    before do
      token = login(auth.id)
      headers = { Authorization: "Bearer #{token}" }
      get api_v1_community_path(community), headers: headers
    end

    it "enqueues VisitorWorker job" do
      expect(VisitorWorker).to have_enqueued_sidekiq_job("Community", community.id, auth.id)
    end
  end
end
