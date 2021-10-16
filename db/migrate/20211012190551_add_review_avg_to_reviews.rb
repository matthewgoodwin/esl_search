class AddReviewAvgToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :ravg, :float
  end
end
