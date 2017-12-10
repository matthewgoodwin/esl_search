class AddConsultationRefToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :consultation, foreign_key: true
  end
end
