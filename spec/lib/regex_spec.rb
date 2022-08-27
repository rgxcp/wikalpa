require "rails_helper"
require "regex"

RSpec.describe REGEX do
  it "::FEATURE_TOGGLE_NAME" do
    expect(REGEX::FEATURE_TOGGLE_NAME).to eq(/\A\S+\z/)
  end

  it "::NAME" do
    expect(REGEX::NAME).to eq(/\A[a-zA-Z0-9.\w]+\z/)
  end
end
