class AddGuidToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :guid, :string
  end
end
