class AddTownToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :town, :string
  end
end
