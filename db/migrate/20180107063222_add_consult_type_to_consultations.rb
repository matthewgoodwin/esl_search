class AddConsultTypeToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consulttype, :string
  end
end
