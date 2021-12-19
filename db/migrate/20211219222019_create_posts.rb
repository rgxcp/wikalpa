class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :community, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :body, null: false
      t.timestamps
    end
  end
end
