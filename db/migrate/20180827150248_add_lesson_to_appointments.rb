class AddLessonToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_reference :appointments, :lesson, foreign_key: true
  end
end
