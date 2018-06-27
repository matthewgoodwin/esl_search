class RemoveConsultFreqssFromConsultation < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :consult_freq, :string
  end
end
