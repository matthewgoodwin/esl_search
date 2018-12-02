class RemoveLocationFromAppointments < ActiveRecord::Migration[5.0]
  def change
    remove_column :appointments, :location, :string
    remove_column :appointments, :start, :datetime
    remove_column :appointments, :end, :datetime
  end
end
