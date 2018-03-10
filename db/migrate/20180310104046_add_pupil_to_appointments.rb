class AddPupilToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :pupil, :string
  end
end
