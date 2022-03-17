class AddIsSpoilerToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :is_spoiler, :boolean, null: false, default: false
  end
end
