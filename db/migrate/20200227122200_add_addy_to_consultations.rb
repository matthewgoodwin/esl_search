class AddAddyToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :address, :string
  end
end
