class RemoveAddrsFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :address, :string
  end
end
