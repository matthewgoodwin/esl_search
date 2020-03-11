class RemoveCoordFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :longitude, :float
    remove_column :consultations, :latitude, :float
  end
end
