class CreatePrivatemessages < ActiveRecord::Migration[5.0]
  def change
    create_table :privatemessages do |t|
      t.string :subject
      t.string :pm
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
