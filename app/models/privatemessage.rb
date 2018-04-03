class Privatemessage < ApplicationRecord
  belongs_to :user

  validates :subject, :pm, presence: true
  validates :pm, length: { maximum: 350, message: "your private message should be shorter than 349 characters!"}
end
