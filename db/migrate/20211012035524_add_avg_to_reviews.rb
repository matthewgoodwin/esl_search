class AddAvgToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :avg, :decimal, precision: 9, scale: 4
  end
end
