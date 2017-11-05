class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true 
  validates :surname, presence: true
  has_one :avatar, class_name: "Photo", foreign_key: "user_id"  

  #Friendship associations
  has_many :requesting_friends, class_name: "Friendship",
  															foreign_key: "request_id",
  															dependent: :destroy
  has_many :accepted_friends, -> { where accepted: true }, class_name: "Friendship",
  															foreign_key: "request_id",
  															dependent: :destroy															
  has_many :requested_friends, class_name: "Friendship",
  															foreign_key: "requested_id",
  															dependent: :destroy
  has_many :friendship_requested, through: :requesting_friends, source: :requested
  has_many :friendship_requests, through: :requested_friends, source: :request	
	has_many :friends, through: :accepted_friends, source: :requested
end
