class User < ApplicationRecord
	has_many :memberships
	has_many :comments
	has_many :groups, :through => :memberships
	validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, 
		message: "is not a valid." }
end
