require 'net/http'

class Lamp < ActiveRecord::Base
  include LampRequests

  validates_inclusion_of :on, :in => [true, false]
  validates :light_identifier, presence: true
  validates_uniqueness_of :light_identifier, scope: :bridge_id, message: "Cannot register the same light."
  belongs_to :bridge
  has_one :user, through: :bridge

end
