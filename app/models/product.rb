class Product < ActiveRecord::Base

	has_many :reviews, dependent: :destroy
	has_many :product_orders
	has_many :orders, through: :product_orders


	has_many :likes, as: :likeable
	has_many :user_likes, through: :likes, source: :user


	validates :name, :price, :stock, presence: true
	validates :description, presence: true

	def remove_like (user)
		self.likes.where(user: user).first.delete

	end

	def liked_by? (user)
		self.user_likes.include? user
	end
end
