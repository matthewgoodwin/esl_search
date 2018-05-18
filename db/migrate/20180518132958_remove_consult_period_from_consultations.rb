class RemoveConsultPeriodFromConsultations < ActiveRecord::Migration[5.0]
  def change
    remove_column :consultations, :consultperiod, :string
  end
end
