class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation, :username
  validates :username, length: {
    minimum: 10,
    maximum: 40,
    too_short: "must be at least 10 characters",
    too_long: "must be at most 40 characters"
  }

  validates_format_of :password, with: /[a-zA-Z]+/, message: "must include a letter"
  validates_format_of :password, with: /\d+/, message: "must include a number"
  validates_format_of :password, without: /\W|\_/, message: "must use alpha-numeric characters"
  validates :password, length: {
    minimum: 8,
    maximum: 20,
    too_short: "must be at least 8 characters",
    too_long: "must be at most 20 characters"
  }

  validates :email, uniqueness: true,
    format: {
      with: /[\w\.\+]+@[\w\.]+\.\w+/,
        message: "must be valid email address" }
  before_save :lowercase_email

  has_one :bridge
  has_many :lamps, through: :bridge
  has_many :groups


  def lowercase_email
    email.downcase!
  end
end
