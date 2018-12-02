class RemoveCondowFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :consult_dur, :string
    remove_column :consultations, :consult_native_speaker, :string
    remove_column :consultations, :consult_dow, :text
  end
end
