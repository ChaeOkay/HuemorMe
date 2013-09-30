class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation, :username
  validates_uniqueness_of :email

  has_many :bridges
  has_many :lamps, through: :bridges
end
