class DropConsultationsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :consultations
  end
end
