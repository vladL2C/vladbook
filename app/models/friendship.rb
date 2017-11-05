class Friendship < ApplicationRecord
	belongs_to :request, class_name: "User"
	belongs_to :requested, class_name: "User"
end
