class AddConsultratioToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :consult_ratio, :string
  end
end
