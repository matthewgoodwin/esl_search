class AddConsultFocusToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consult_focus, :string
  end
end
