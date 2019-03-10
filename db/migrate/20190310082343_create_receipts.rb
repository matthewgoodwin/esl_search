class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.string :invoice_num
      t.references :consultation, foreign_key: true

      t.timestamps
    end
  end
end
