class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :consultations, dependent: :destroy
         has_many :appointments, dependent: :destroy
         has_many :reviews, dependent: :destroy
         has_many :messages, dependent: :destroy
         has_many :referrals, dependent: :destroy
         has_many :privatemessages, dependent: :destroy

         validates :fname, :lname, :email, :city, :address, presence: true
         validates :fname, uniqueness: {scope: :email, message: "already a memeber? please log in!"}
end
