class AddDemographicToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_demo, :string
  end
end
