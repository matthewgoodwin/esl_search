class AddSenderToPrivatemessages < ActiveRecord::Migration[5.0]
  def change
    add_column :privatemessages, :sender, :integer
  end
end
