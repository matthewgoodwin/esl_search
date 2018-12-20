class AddClientIdToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :client_id, :integer
    add_index :clients, :client_id
    #rails generate migration AddClientIdToClients client_id:integer:index
  end
end
