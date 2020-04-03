class AddConsRefToTbls < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :consultation, foreign_key: true
    add_reference :lessons, :consultation, foreign_key: true
    add_reference :messages, :consultation, foreign_key: true
    add_reference :receipts, :consultation, foreign_key: true
    add_reference :reviews, :consultation, foreign_key: true
  end
end
