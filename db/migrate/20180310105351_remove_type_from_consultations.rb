class RemoveTypeFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :type, :string
  end
end
