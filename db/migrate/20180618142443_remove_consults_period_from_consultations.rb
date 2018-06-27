class RemoveConsultsPeriodFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :consult_period, :string
  end
end
