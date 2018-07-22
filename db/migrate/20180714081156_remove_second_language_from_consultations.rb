class RemoveSecondLanguageFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :sec_language, :string
  end
end
