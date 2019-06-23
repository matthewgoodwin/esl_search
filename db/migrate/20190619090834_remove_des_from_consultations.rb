class RemoveDesFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :consult_desc, :string
  end
end
