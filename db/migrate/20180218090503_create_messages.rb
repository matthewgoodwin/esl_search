class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.string :textmess
      t.references :consultation, foreign_key: true

      t.timestamps
    end
  end
end
