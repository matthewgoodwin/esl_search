class RemoveNativeSpeakerFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :native_speaker, :string
  end
end
