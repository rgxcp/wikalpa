ENV["JWT_KEY"] = "JWT_KEY"

require "rails_helper"
require "json_web_token"

RSpec.describe JsonWebToken do
  let(:payload) { { user_id: 1, session_id: 2 } }

  describe ".encode" do
    it "returns encoded payload" do
      allow(JWT).to receive(:encode).with(payload, "JWT_KEY", "HS256").and_return("TOKEN")

      expect(JsonWebToken.encode(payload)).to eq("TOKEN")
    end
  end

  describe ".decode" do
    it "returns decoded token" do
      allow(JWT).to receive(:decode).with("TOKEN", "JWT_KEY", "HS256").and_return(payload)

      expect(JsonWebToken.decode("TOKEN")).to eq(payload)
    end
  end
end
