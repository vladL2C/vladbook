class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true 
  validates :surname, presence: true 
  has_one :avatar, class_name: "Photo", foreign_key: "user_id"     
end
