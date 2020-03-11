class AddCoordslonglatToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :longitude, :float
    add_column :consultations, :latitude, :float
  end
end
