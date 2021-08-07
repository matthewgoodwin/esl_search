class User < ApplicationRecord
  before_create :set_color
  # after_create :anyeong
  # ^ sends welcome letter after creation

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :consultations, dependent: :destroy
         has_many :appointments, dependent: :destroy
         has_many :reviews, dependent: :destroy
         has_many :messages, dependent: :destroy
         has_many :referrals, dependent: :destroy
         has_many :privatemessages, dependent: :destroy
         has_many :clients, dependent: :destroy

         validates :fname, :username, :user_native_lang, :email, :city, presence: true
         validates :fname, uniqueness: {scope: :email, message: "already a memeber? please log in!"}

  def first_in(element) #element if @consultations instance from _index.html
    element.fname.slice(0)
  end
  def set_degree(element) #from _index_data.html.erb
    case element.degree
    when 1
      degree = "fas fa-graduation-cap"
    when 2
      degree = "fas fa-university"
    when 3
      degree = "fas fa-university"
    when 4
      degree = "fas fa-university"
    end
  end

  def set_expert(element)
    case element.expert
    when 1
      expert = "fas fa-chess-pawn"
    when 2
      expert = "fas fa-chess-knight"
    when 3
      expert = "fas fa-chess-bishop"
    when 4
      expert = "fas fa-chess-rook"
    when 5
      expert = "fas fa-chess-queen"
    end
  end

  private
    # def anyeong
    #   UserMailer.welcome(self).deliver_now
    # end
    def set_color
      self.color = ["#7AD8E5", "#63b4d1", "6da7d3", "#7699d4", "#816ec4", "#8658bc", "#602278", "#34023C"].sample
    end
end
