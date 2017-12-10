class Consultation < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  validates :type, presence: true
  validates :focus, presence: true
end
