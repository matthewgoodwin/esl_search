class AddConsFeeToConsultations < ActiveRecord::Migration[5.2]
  def change
    add_column :consultations, :consult_fee, :decimal, precision: 19, scale: 2
  end
end
