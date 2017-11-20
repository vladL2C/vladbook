class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :avatar, class_name: "Photo", foreign_key: "user_id"  

  #Friendship associations
  has_many :requesting_friends, class_name: "Friendship",
  foreign_key: "request_id", dependent: :destroy
  #Requested Friends that have accepted
  has_many :accepted_friends, -> { where accepted: true }, class_name: "Friendship",
  foreign_key: "request_id", dependent: :destroy

  has_many :requested_friends, class_name: "Friendship",
  foreign_key: "requested_id", dependent: :destroy

  has_many :friendship_requested, through: :requesting_friends, source: :requested, dependent: :destroy
  has_many :friendship_requests, through: :requested_friends, source: :request, dependent: :destroy	
	has_many :friends, through: :accepted_friends, source: :requested, dependent: :destroy

  #Post associations
  has_many :posts, dependent: :destroy
  has_many :comments

  #likes associations
  has_many :likes

  #Validations
  validates :name, presence: true 
  validates :surname, presence: true

  def add_user(user)
    friendship_requested << user 
  end 

  def added?(user)
    friendship_requested.include?(user)
  end

  def decline_request(user)
    friendship_requests.destroy(user)
  end 

  def cancle_add(user)
    friendship_requested.destroy(user)
  end
    
end
