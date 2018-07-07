class AddConsultationDowToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_dow, :text, array: true, default: []
  end
end
