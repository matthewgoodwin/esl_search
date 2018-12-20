class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.integer :client_id
      t.string :fname
      t.string :lname

      t.timestamps
    end
  end
end
