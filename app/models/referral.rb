class Referral < ApplicationRecord
  belongs_to :user

  validates :comment, :star, presence: true
  validates :comment, length: { maximum: 280, message: "Your review must be shorter than 280 characters!" }
  validates :star, numericality: { only_integer: true }
  validates :star, inclusion: { in: (1..5), message: "Your rating should be between 1 and 5!" }

end
