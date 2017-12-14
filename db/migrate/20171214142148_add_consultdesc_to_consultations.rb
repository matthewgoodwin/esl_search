class AddConsultdescToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consultdesc, :string
  end
end
