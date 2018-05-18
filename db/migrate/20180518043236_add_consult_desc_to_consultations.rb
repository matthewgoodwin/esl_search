class AddConsultDescToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_desc, :string
  end
end
