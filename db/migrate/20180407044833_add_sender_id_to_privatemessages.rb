class AddSenderIdToPrivatemessages < ActiveRecord::Migration[5.0]
  def change
    add_column :privatemessages, :sender_id, :integer
    add_index :privatemessages, :sender_id
    # rails generate migration AddSenderIdToPrivatemessages sender_id:integer:index
  end
end
