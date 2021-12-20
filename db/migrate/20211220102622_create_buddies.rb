class CreateBuddies < ActiveRecord::Migration[6.1]
  def change
    create_table :buddies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :buddy, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
