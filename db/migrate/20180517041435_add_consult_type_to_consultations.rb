class AddConsultTypeToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_type, :string
  end
end
