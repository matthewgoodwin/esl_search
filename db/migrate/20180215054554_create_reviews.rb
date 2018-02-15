class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :star
      t.references :consultation, foreign_key: true

      t.timestamps
    end
  end
end
