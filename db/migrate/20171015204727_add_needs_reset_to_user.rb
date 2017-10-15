class AddNeedsResetToUser < ActiveRecord::Migration
  def change
    add_column :users, :needs_reset, :boolean
  end
end
