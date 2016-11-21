class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :text
      t.references :prompt
      t.references :user
      t.references :group

      t.timestamps
    end
    add_index :responses, :user_id
    add_index :responses, :prompt_id
    add_index :responses, :group_id
  end
end
