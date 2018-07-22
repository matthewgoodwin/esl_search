class AddNativeSpeakerToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :native_speaker, :string
  end
end
