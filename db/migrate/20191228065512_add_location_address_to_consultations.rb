class AddLocationAddressToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_location_add, :string
  end
end
