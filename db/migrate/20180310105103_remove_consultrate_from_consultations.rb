class RemoveConsultrateFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :consultrate, :decimal, :precision => 5, :scale => 2
  end
end
