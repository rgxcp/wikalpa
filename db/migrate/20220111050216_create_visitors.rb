class CreateVisitors < ActiveRecord::Migration[6.1]
  def change
    create_table :visitors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :visitable, null: false, polymorphic: true
      t.timestamps
    end
  end
end
