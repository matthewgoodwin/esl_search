class CreateReferrals < ActiveRecord::Migration[5.0]
  def change
    create_table :referrals do |t|
      t.string :comment
      t.integer :star
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
