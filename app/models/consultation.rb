class Consultation < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :receipts, dependent: :destroy
  accepts_nested_attributes_for :lessons

  validates :consult_title, :consult_language, :consult_type, :consult_period, presence: true
  validates :consultfee, :consult_desc, :consult_demo, :consult_location, presence: true
  validates :consult_desc, length: { maximum: 50000, too_long: "%{count} characters is the maximum allowed. Please shorten your description!" }
  before_save :proper_format
  private
  def proper_format
    self.consult_title.downcase!
    self.consult_title.capitalize!
    self.consult_location.downcase!
    self.consult_location.capitalize!
    self.consult_focus.downcase!
  end
end
