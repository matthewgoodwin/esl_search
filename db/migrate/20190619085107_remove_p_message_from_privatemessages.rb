class RemovePMessageFromPrivatemessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :privatemessages, :pm, :string
  end
end
