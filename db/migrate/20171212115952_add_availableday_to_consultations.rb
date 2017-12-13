class AddAvailabledayToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :availableday, :string
  end
end
