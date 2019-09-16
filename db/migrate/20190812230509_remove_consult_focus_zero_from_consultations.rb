class RemoveConsultFocusZeroFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :consult_focus, :string
  end
end
