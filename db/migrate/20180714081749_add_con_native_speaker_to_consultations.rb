class AddConNativeSpeakerToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_native_speaker, :string
  end
end
