class AddUserNativeLanguageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_native_lang, :string
  end
end
