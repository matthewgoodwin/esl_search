class Consultation < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :receipts, dependent: :destroy
  accepts_nested_attributes_for :lessons

  # validates :consult_title, :address, presence: true # uncomment to test geocoder in rails console
  validates :consult_title, presence: { message: :bad_title }
  validates :consult_language, presence: { message: :bad_lang }
  validates :consult_type, presence: { message: :bad_type }
  validates :consult_env, presence: { message: :bad_env }
  validates :consult_period, presence: { message: :bad_period }
  validates :consult_fee, presence: { message: :bad_fee}
  validates :consult_desc, presence: { message: :bad_desc }
  validates :consult_demo, presence: { message: :bad_demo }
  validates :consult_city, presence: { message: :bad_city }
  validates :consult_ratio, presence: true
  validates :address, presence: { message: :bad_address}

  # validates :consult_fee, :consult_desc, :consult_demo, :address, :consult_city, presence: { message: "Please enter all required information! "}

  validates :consult_focus, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed. Please shorten your 'FOCUS' description!" }
  validates :consult_desc, length: { in: 200..2000, message: "Your description should be 200 - 2000 characters" }
  before_save :proper_format

  include PgSearch::Model

  pg_search_scope :search_by_x,
  against: [
    # https://github.com/Casecommons/pg_search#weighting
    [:consult_title, 'A'],
    [:consult_language, 'B'],
    [:consult_city, 'C'],
    [:consult_type, 'D'], # end of weighting
    :consult_focus,
    :consult_env,
    :consult_desc,
    :consult_period,
    :consult_ratio
  ], # end of against
  using: {
    tsearch: {
      prefix: true,
      highlight: {
        StartSel: '<h1>',
        StopSel: '</h1>',
        MaxWords: 123,
        MinWords: 456,
        ShortWord: 4,
        HighlightAll: true,
        MaxFragments: 3,
        FragmentDelimiter: '&hellip;'
      }
    }

  } # end of using

  geocoded_by :address
  after_validation :geocode

  def first_in(element) #element if @consultations instance from _index.html
    element.user.fname.slice(0)
  end

  private
  def proper_format
    # self.consult_title.downcase!
    # self.consult_title.capitalize!
    self.consult_city.downcase!
    self.consult_city.capitalize!
    self.consult_focus.downcase!
  end
end
