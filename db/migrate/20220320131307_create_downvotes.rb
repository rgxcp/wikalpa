class CreateDownvotes < ActiveRecord::Migration[6.1]
  def change
    create_table :downvotes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :downvoteable, null: false, polymorphic: true
      t.timestamps
    end
  end
end
