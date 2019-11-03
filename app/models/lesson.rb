class Lesson < ApplicationRecord
  belongs_to :consultation
  has_many :appointments, dependent: :destroy

  validates :lesson_level, :lesson_section, :lesson_start, presence: true
  validates :lesson_capacity, presence: true
  validates :lesson_capacity, inclusion: { in: 1..10 }
  # validates :start_end_time
  private
  # def self.set_lesson_end_time
  #   @end = @lesson.lesson_start + @lesson.lesson_max_dur
  #   return @end
  # end
  # def start_end_time
  #   if lesson_start >= lesson_end
  #     errors.add(:end_time, "must be after start time")
  #   end
  # end
end
