class Consultation < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :receipts, dependent: :destroy
  accepts_nested_attributes_for :lessons

  # validates :consult_title, :address, presence: true # uncomment to test geocoder in rails console
  validates :consult_title, :consult_language, :consult_type, :consult_period, presence: true
  validates :consult_fee, :consult_desc, :consult_demo, :address, :consult_city, presence: true
  validates :consult_focus, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed. Please shorten your description!" }
  validates :consult_desc, length: { in: 200..2000, wrong_length: "Your description must be between 200 and 2000 characters" }
  before_save :proper_format

  geocoded_by :address
  after_validation :geocode

  private
  def proper_format
    # self.consult_title.downcase!
    # self.consult_title.capitalize!
    self.consult_city.downcase!
    self.consult_city.capitalize!
    self.consult_focus.downcase!
  end
end
