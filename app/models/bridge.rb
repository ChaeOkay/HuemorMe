class Bridge < ActiveRecord::Base
  belongs_to :user
  has_many :lamps

end
