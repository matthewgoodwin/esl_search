class AddConsultfeeToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consultfee, :decimal, precision: 19, scale: 2
  end
end
