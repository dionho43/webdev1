class User < ActiveRecord::Base
	has_secure_password
	has_many :items, dependent: :destroy
	validates :username, presence: true #Not null	
	validates :username, uniqueness: true #Unique
	
	validates :password_digest, presence: true #Not null	
	validates :email, presence: true
end
