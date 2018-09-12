class Message < ApplicationRecord
  belongs_to :consultation
  belongs_to :user

  validates :subject, :textmess, presence: true
  validates :textmess, length: { maximum: 350, message: "your message should be shorter than 350 characters!"}
end
