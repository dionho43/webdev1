class Rating < ActiveRecord::Base
	belongs_to :item
	validates :score, presence: true #Not null	
	validates :item_id, presence: true #Not null	
end