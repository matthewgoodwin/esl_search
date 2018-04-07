class RemoveSenderFromPrivatemessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :privatemessages, :sender, :integer
  end
end
