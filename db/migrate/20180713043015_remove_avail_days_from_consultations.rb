class RemoveAvailDaysFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :availableday, :string
  end
end
