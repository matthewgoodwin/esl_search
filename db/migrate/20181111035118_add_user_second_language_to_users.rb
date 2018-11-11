class AddUserSecondLanguageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_second_lang, :string
  end
end
