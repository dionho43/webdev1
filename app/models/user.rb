class User < ActiveRecord::Base
	has_secure_password
	has_many :items, dependent: :destroy
	validates :username, presence: true #Not null	
	validates :username, uniqueness: true #Unique
	
	validates :password_digest, presence: true #Not null	
	validates :email, presence: true
	
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
end
