class Lesson < ApplicationRecord
  belongs_to :consultation
  has_many :appointments, dependent: :destroy

  validates :lesson_level, :lesson_section, :lesson_dow, presence: true
end
