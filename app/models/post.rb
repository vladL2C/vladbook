class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable
  belongs_to :user 
end
