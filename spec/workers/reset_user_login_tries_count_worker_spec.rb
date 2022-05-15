require "rails_helper"

RSpec.describe ResetUserLoginTriesCountWorker, type: :worker do
  describe ".perform_async" do
    it do
      ResetUserLoginTriesCountWorker.perform_async(1)
      expect(ResetUserLoginTriesCountWorker).to have_enqueued_sidekiq_job(1)
    end
  end

  describe "#perform" do
    it "resets user login tries count to 0" do
      user = create(:user, login_tries_count: 6)
      ResetUserLoginTriesCountWorker.new.perform(user.id)
      user.reload
      expect(user.login_tries_count).to eq(0)
    end
  end
end
