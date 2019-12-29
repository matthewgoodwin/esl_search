class AddCoordinatesToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_latitude, :float
    add_column :consultations, :consult_longitude, :float
  end
end
