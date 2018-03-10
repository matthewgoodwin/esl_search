class AddInvoiceNumToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :invoice_number, :string
  end
end
