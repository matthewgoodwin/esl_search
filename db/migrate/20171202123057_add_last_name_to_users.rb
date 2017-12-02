class AddLastNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lname, :string
  end
end
