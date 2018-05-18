class RemoveConsultDurFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :consultdur, :string
  end
end
