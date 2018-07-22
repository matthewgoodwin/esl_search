class AddSecLanguageToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_sec_lang, :string
  end
end
