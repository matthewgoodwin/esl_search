class RemoveNamesFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :fname, :string
    remove_column :clients, :lname, :string
  end
end
