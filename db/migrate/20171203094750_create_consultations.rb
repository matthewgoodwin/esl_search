class CreateConsultations < ActiveRecord::Migration[5.0]
  def change
    create_table :consultations do |t|
      t.references :user, foreign_key: true
      t.string :type
      t.string :focus

      t.timestamps
    end
  end
end
