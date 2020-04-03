class RemoveConsultationFromReceipts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :receipts, :consultation, foreign_key: true
    # rails g migration RemoveConsultationFromReceipts consultation:references
  end
end
