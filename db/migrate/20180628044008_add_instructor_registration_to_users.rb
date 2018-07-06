class AddInstructorRegistrationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :instructor_reg, :string
  end
end
