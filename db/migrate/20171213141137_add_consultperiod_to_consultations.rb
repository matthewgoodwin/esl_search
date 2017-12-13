class AddConsultperiodToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consultperiod, :string
  end
end
