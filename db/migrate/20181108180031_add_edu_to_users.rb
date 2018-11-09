class AddEduToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :edu, :string
  end
end
