class CreateCollectionItems < ActiveRecord::Migration[6.1]
  def change
    create_table :collection_items do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :collectable, null: false, polymorphic: true
      t.timestamps
    end
  end
end
