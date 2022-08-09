require "rails_helper"

RSpec.describe "Get a reply by id", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  context "when reply not exists" do
    before { get api_v1_reply_path(0) }

    it "returns not found response" do
      expect(response).to have_http_status(:not_found)
      expect(parsed_body["success"]).to be(false)
      expect(parsed_body["message"]).to eq("Not Found")
    end
  end

  context "when reply exists" do
    before do
      reply = create(:reply)
      get api_v1_reply_path(reply)
    end

    it "returns ok response" do
      expect(response).to have_http_status(:ok)
      expect(parsed_body["success"]).to be(true)
      expect(parsed_body["message"]).to eq("OK")
      expect(parsed_body["data"]["reply"]).to be_present
    end
  end
end
