class AddPromptToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :prompt, :text
  end
end
