class User < ActiveRecord::Base

	before_save	:default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_many :reviews, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :pruduct_likes, through: :likes, source: :likeable, source_type: 'Product'
  has_many :review_likes, through: :likes, source: :likeable, source_type: 'Review'

  validates :name, :last_name, :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validate :validate_username


  enum role: [:admin, :client, :guest]

  def default_role
  	self.role ||= 1

  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def to_s
    "#{self.name} #{self.last_name}"
  end
end
