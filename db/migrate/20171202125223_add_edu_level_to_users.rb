class AddEduLevelToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :edulevel, :string
  end
end
