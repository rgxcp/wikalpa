require "rails_helper"
require "regex"

RSpec.describe REGEX do
  context "::FEATURE_TOGGLE_NAME" do
    it { expect(REGEX::FEATURE_TOGGLE_NAME).to eq(/\A\S+\z/) }
  end

  context "::NAME" do
    it { expect(REGEX::NAME).to eq(/\A[a-zA-Z0-9.\w]+\z/) }
  end
end
