class Consultation < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :consult_title, :consult_language, :consult_type, presence: true
  validates :consult_focus, :consultfee, :consult_desc, :consult_location, presence: true

  # serialize :consult_freq, Array


  DAYOFWEEK = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
  before_save :proper_format
  # before_save :dow
  private

  # def dow
  #   self.consult_freq << params[:consult_freq]
  # end

  def proper_format
    self.consult_title.downcase!
    self.consult_title.capitalize!
    self.consult_location.downcase!
    self.consult_location.capitalize!
    self.consult_focus.downcase!
  end
end
