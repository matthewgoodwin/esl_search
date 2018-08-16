class AddReviewTitleToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :review_title, :string
  end
end
