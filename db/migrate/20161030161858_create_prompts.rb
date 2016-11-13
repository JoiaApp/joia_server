class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.boolean :personal
      t.boolean :business
      t.text :phrase

      t.timestamps
    end
  end
end
