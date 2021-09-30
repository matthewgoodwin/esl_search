class Review < ApplicationRecord
  belongs_to :consultation
  belongs_to :user

  validates :star, :review_title, :punct, :prep, :org, :know, :comm, :adapt, :respond, :succ, presence: true
  validates :star, numericality: { only_integer: true }
  validates :star, inclusion: { in: (1..5), message: "Your rating should be between 1 and 5!" }
  # validates :user, uniqueness: { scope: :email, message: "you can only create one review!"}
end
