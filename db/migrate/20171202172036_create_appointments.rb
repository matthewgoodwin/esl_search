class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :start
      t.datetime :end
      t.string :pupname
      t.string :location

      t.timestamps
    end
  end
end
