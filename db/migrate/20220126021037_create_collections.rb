class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, limit: 25, null: false
      t.timestamps
    end
  end
end
