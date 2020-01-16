class RemoveConsultLocatAddressFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :consult_location_add, :string
  end
end
