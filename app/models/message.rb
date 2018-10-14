class Message < ApplicationRecord
  belongs_to :consultation
  belongs_to :user

  validates :subject, :textmess, presence: true
  validates :subject, length: { maximum: 40, too_long: "%{count} characters is the maximum allowed. please enter agian!" }
  validates :textmess, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed" }
end
