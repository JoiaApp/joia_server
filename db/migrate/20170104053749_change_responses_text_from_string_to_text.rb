class ChangeResponsesTextFromStringToText < ActiveRecord::Migration
  def change
    change_column :responses, :text, :text
  end
end
