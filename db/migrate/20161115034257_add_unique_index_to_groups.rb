class AddUniqueIndexToGroups < ActiveRecord::Migration
  def change
    add_index :user_groups, [:group_id, :user_id], unique: true
  end
end
