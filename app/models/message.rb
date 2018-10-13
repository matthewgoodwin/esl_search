class Message < ApplicationRecord
  belongs_to :consultation
  belongs_to :user

  validates :subject, :textmess, presence: true
  validates :textmess, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
end
