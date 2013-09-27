class Lamp < ActiveRecord::Base
  validates_inclusion_of :on, :in => [true, false]

  def turn_on_off
    self.on =  self.on ? false : true
  end
end
