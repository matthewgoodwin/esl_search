class AddCityToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_city, :string
  end
end
