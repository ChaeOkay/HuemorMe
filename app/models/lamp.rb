require 'net/http'

class Lamp < ActiveRecord::Base
  include LampRequests

  validates_inclusion_of :on, :in => [true, false]
  validates :hue_number, presence: true
  validates_uniqueness_of :hue_number, scope: :bridge_id, message: "Cannot register the same light."
  belongs_to :bridge
  belongs_to :group

  def send_command(command, args = nil)
    args ? self.send(command, args) : self.send(command)
  end
end
