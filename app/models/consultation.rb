class Consultation < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  validates :type, :focus, presence: true
end
