class Lesson < ApplicationRecord
  belongs_to :consultation
  has_many :appointments, dependent: :destroy

  validates :lesson_level, :lesson_section, :lesson_start, presence: true
  validates :lesson_capacity, :lesson_dow, presence: true
end
