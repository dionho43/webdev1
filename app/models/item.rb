class Item < ActiveRecord::Base

	belongs_to :category
	belongs_to :user
	has_many :ratings, dependent: :destroy
	mount_uploader :attachment, AttachmentUploader
	
	validates :title, presence: true #Not null	
	validates :price, presence: true #Not null
	validates :location, presence: true #Not null
	
	def self.search(query)
		where("title LIKE ? OR location LIKE ?", "%#{query}%", "%#{query}%")
	end

	
end
