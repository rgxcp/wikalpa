class CollectionWorker
  include Sidekiq::Worker

  def perform(id)
    collection = Collection.find(id)
    collection_items_count = collection.collection_items.count
    collection.destroy if collection_items_count == 0
  end
end
