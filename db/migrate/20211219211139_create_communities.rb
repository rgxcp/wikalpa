class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.string :name, limit: 20, null: false, index: { unique: true }
      t.string :description, null: false
      t.timestamps
    end
  end
end
