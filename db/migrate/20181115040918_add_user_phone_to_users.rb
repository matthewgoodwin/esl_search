class AddUserPhoneToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_phone, :string
  end
end
