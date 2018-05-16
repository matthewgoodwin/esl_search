class AddConsultTitleToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_title, :string
  end
end
