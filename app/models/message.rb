class Message < ApplicationRecord
  belongs_to :consultation

  validates :subject, :textmess, presence: true, message: { "you must include a subject and message!" }
  validates :textmess, length: { maximum: 350, message: "your message should be shorter than 349 characters!"}
end
