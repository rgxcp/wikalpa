require "rails_helper"

RSpec.describe CollectionWorker, type: :worker do
  describe ".perform_async" do
    it do
      CollectionWorker.perform_async(1)
      expect(CollectionWorker).to have_enqueued_sidekiq_job(1)
    end
  end

  describe "#perform" do
    it "deletes collection when collection items count equal to zero" do
      collection = create(:collection)
      collection_item = collection.collection_items.first
      collection_item.destroy
      collection = CollectionWorker.new.perform(collection.id)
      expect(collection.destroyed?).to be(true)
    end
  end
end
