class AddReviewAttToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :punct, :integer
    add_column :reviews, :prep, :integer
    add_column :reviews, :org, :integer
    add_column :reviews, :know, :integer
    add_column :reviews, :comm, :integer
    add_column :reviews, :adapt, :integer
    add_column :reviews, :respond, :integer
    add_column :reviews, :succ, :integer
  end
end
