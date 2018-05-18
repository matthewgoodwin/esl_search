class RemoveFocusFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :focus, :string
  end
end
