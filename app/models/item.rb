class Item < ActiveRecord::Base

	belongs_to :category
	belongs_to :user
	has_many :ratings, dependent: :destroy
	
	validates :title, presence: true #Not null	
	validates :price, presence: true #Not null
	validates :location, presence: true #Not null	
end
