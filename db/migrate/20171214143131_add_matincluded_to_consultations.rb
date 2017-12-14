class AddMatincludedToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :matincluded, :string
  end
end
