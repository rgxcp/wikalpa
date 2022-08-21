require "rails_helper"
require "string"

RSpec.describe String do
  describe "#integer?" do
    ["1.2", "3,4", "A", "a", "@"].each do |item|
      context "when object is '#{item}'" do
        it "returns false" do
          expect(item.integer?).to be(false)
        end
      end
    end

    ["-1", "2"].each do |item|
      context "when object is '#{item}'" do
        it "returns true" do
          expect("1".integer?).to be(true)
        end
      end
    end
  end
end
