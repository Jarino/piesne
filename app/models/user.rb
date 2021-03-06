# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :role_id

  has_secure_password


  before_save { email.downcase! }
  before_save :create_remember_token

  has_many :favourites
  has_many :links
  has_many :songs, :through => :favourites
  has_many :verses
  has_many :songs
  belongs_to :role
  

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  private

  	def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
