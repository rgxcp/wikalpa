class RenameMembersToCommunityMembers < ActiveRecord::Migration[6.1]
  def change
    rename_table :members, :community_members
  end
end
