class RemoveConsloctownFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :consult_location, :string
    remove_column :consultations, :consult_location_town, :string
  end
end
