class AddSecondaryLanguageToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :sec_language, :string
  end
end
