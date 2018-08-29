class Lesson < ApplicationRecord
  belongs_to :consultation
  has_many :appointments, dependent: :destroy
end
