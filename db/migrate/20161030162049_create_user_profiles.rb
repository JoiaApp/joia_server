class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user
      t.string :image
      t.datetime :reminder_time

      t.timestamps
    end
    add_index :user_profiles, :user_id
  end
end
