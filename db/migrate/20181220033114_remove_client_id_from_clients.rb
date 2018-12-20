class RemoveClientIdFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :client_id, :integer
  end
end
