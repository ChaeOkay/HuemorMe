class Bridge < ActiveRecord::Base
  belongs_to :user
  has_many :lamps

  validates_uniqueness_of :device_id, scope: :user_id, message: "can not register the same bridge twice"
  validates :ip, :device_id, presence: true

end