class AddConsultFrequencyToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_freq, :string
  end
end
