class Category < ActiveRecord::Base
	has_many :products, dependent: :destroy

  def to_s
    self.name
  end
end
