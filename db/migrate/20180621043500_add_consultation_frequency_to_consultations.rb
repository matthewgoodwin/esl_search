class AddConsultationFrequencyToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_freq, :string, array: true, default: []
  end
end
