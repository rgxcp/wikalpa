require "rails_helper"

RSpec.describe VisitorWorker, type: :worker do
  describe ".perform_async" do
    it do
      VisitorWorker.perform_async("VisitableType", 1, 1)
      expect(VisitorWorker).to have_enqueued_sidekiq_job("VisitableType", 1, 1)
    end
  end

  describe "#perform" do
    it "adds visitable visitor by one" do
      community = create(:community)
      user1 = create(:user)
      user2 = create(:user)
      visitable = create(:post, community: community, user: user2)
      VisitorWorker.new.perform(visitable.class.name, visitable.id, user1.id)
      visitor_count = Visitor.where(user: user1, visitable: visitable).count
      expect(visitor_count).to eq(1)
    end
  end
end
