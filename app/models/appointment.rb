class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :consultation
  validates :start, :end, :location, :pupname, presence: true
end
