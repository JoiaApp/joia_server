class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :password
      t.references :business
      t.boolean :personal

      t.timestamps
    end
    add_index :groups, :business_id
  end
end
