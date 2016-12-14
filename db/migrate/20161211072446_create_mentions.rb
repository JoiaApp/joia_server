class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.references :response
      t.references :user
      t.timestamps
    end
  end
end
