class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :consultation
  belongs_to :lesson
  # accepts_nested_attributes_for :lessons

  validates :start, :end, :pupil, :invoice_number, presence: true
  validates :invoice_number, uniqueness: {scope: :user}

  private
    def self.invoice_number
      @in_num = rand(36**8).to_s(36)
      return @in_num
    end
end
