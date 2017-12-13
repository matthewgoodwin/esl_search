class AddConsultrateToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consultrate, :decimal, :precision => 5, :scale => 2
  end
end
