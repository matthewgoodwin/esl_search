class CreateNewConsultations < ActiveRecord::Migration[5.2]
  def change
    create_table :consultations do |t|
      t.references :user, foreign_key: true
      t.string :consult_title
      t.string :consult_type
      t.string :consult_language
      t.string :consult_period
      t.string :consult_sec_lang
      t.string :consult_demo
      t.text :consult_desc
      t.text :consult_focus
      t.string :consult_city
      t.string :consult_mat
      t.string :address
      t.float :longitude
      t.float :latitude


      t.timestamps
    end
  end
end
