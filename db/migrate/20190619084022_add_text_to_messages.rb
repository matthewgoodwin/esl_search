class AddTextToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :textmess, :text
  end
end
