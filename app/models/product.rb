class Product < ApplicationRecord
	has_many :orders
	has_many :comments

	
	def highest_rating_comment
  	comments.rating_desc.first
  	end
  	def lowest_rating_comment
  	comments.rating_desc.last
	end

	validates :name, presence: true
	def average_rating
  	comments.average(:rating).to_f
	end
		end

