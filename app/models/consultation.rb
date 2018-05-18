class Consultation < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :consult_language, :consult_type, :consult_focus, presence: true
end
