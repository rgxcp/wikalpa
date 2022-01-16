require "rails_helper"

RSpec.describe VisitorWorker, type: :worker do
  describe ".perform_async" do
    it do
      VisitorWorker.perform_async("VisitableType", 1, 1)
      expect(VisitorWorker).to have_enqueued_sidekiq_job("VisitableType", 1, 1)
    end
  end
end
