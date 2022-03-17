class AddIsSpoilerToReplies < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :is_spoiler, :boolean, null: false, default: false
  end
end
