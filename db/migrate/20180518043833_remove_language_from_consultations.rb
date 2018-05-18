class RemoveLanguageFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :language, :string
  end
end
