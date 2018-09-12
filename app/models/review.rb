class Review < ApplicationRecord
  belongs_to :consultation
  belongs_to :user

  validates :comment, :star, :review_title, presence: true
  validates :comment, length: { maximum: 400, message: "Your review must be shorter than 400 characters!" }
  validates :star, numericality: { only_integer: true }
  validates :star, inclusion: { in: (1..5), message: "Your rating should be between 1 and 5!" }
end
