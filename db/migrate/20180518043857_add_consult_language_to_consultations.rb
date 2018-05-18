class AddConsultLanguageToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_language, :string
  end
end
