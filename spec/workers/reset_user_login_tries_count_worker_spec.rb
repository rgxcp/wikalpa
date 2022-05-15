require "rails_helper"

RSpec.describe ResetUserLoginTriesCountWorker, type: :worker do
  describe ".perform_async" do
    it do
      ResetUserLoginTriesCountWorker.perform_async(1)
      expect(ResetUserLoginTriesCountWorker).to have_enqueued_sidekiq_job(1)
    end
  end
end
