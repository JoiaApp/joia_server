class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :user
      t.references :mention
      t.string :mention_email
      t.string :mention_text
      t.references :prompt
      t.boolean :favorite

      t.timestamps
    end
    add_index :entries, :user_id
    add_index :entries, :mention_id
    add_index :entries, :prompt_id
  end
end
