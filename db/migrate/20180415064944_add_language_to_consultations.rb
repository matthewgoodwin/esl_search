class AddLanguageToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :language, :string
  end
end
