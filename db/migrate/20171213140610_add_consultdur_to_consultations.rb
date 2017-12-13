class AddConsultdurToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consultdur, :string
  end
end
