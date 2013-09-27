class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  validates_uniqueness_of :email
end
