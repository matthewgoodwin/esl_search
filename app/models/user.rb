class User < ApplicationRecord
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

         validates :fname, :username, :email, :city, presence: true
         validates :fname, uniqueness: {scope: :email, message: "already a memeber? please log in!"}
  private
    # def anyeong
    #   UserMailer.welcome(self).deliver_now
    # end
end
