class Consultation < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :appointments, dependent: :destroy
  validates :consulttype, :focus, presence: true
end
