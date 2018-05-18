class RemoveConsultDescFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :consultdesc, :string
  end
end
