class RemoveConsultFreqFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :consultfreq, :string
  end
end
