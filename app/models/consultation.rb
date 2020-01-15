class Consultation < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :receipts, dependent: :destroy
  accepts_nested_attributes_for :lessons

  validates :consult_title, :consult_language, :consult_type, :consult_period, presence: true
  validates :consultfee, :consult_desc, :consult_demo, :consult_location, :consult_location_add, presence: true
  validates :consult_focus, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed. Please shorten your description!" }
  validates :consult_desc, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed. Please shorten your description!" }
  validates :consult_desc, length: { minimum: 100, too_short: "%{count} characters is the minimum allowed. Please provide a longer description!" }
  # validates :consult_desc, length: { in: 200..2000, wrong_length: "your description must be between 200 and 2000 characters" }
  before_save :proper_format
  geocoded_by :consult_location_add

  after_validation :geocode


  private
  def proper_format
    # self.consult_title.downcase!
    # self.consult_title.capitalize!
    self.consult_location.downcase!
    self.consult_location.capitalize!
    self.consult_focus.downcase!
    # self.consult_location_add.downcase!
    # self.consult_location_add.capitalize!
  end
end
