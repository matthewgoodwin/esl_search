class AddDegreeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :degree, :integer
  end
end
