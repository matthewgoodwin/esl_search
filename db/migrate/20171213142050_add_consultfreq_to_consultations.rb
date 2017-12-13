class AddConsultfreqToConsultations < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :consultfreq, :string
  end
end
