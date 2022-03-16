class RenameLikesToUpvotes < ActiveRecord::Migration[6.1]
  def change
    rename_table :likes, :upvotes
    rename_column :upvotes, :likeable_type, :upvoteable_type
    rename_column :upvotes, :likeable_id, :upvoteable_id
    rename_index :upvotes, "index_likes_on_likeable", "index_upvotes_on_upvoteable"
  end
end
