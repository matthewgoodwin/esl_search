class RenameConsultLongitudeToLongitude < ActiveRecord::Migration[5.0]
  def change
    rename_column :consultations, :consult_latitude, :latitude
    rename_column :consultations, :consult_longitude, :longitude
  end
end
