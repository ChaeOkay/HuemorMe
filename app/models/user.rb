class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation, :username
  validates :username, length: {
    minimum: 10,
    maximum: 40,
    too_short: "must be at least 10 characters",
    too_long: "must be at most 40 characters"
  }
  validates :email, uniqueness: true,
    format: {
      with: /[\w\.\+]+@[\w\.]+\.\w+/,
        message: "must be valid email address" }

  has_many :bridges
  has_many :lamps, through: :bridges
  has_many :groups
end
