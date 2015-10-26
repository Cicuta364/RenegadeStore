class Cart < ActiveRecord::Base

  belongs_to :user

  has_many :product

  validates :user_id, uniqueness: { scope: :product_id }
end
