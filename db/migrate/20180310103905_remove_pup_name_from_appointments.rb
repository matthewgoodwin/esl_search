class RemovePupNameFromAppointments < ActiveRecord::Migration[5.0]
  def change
    remove_column :appointments, :pupname, :string
  end
end
