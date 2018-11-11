class AddUserNationalityToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_nation, :string
  end
end
