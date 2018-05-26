class AddConsultLocationToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_location, :string
  end
end
