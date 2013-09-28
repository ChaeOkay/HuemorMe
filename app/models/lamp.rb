class Lamp < ActiveRecord::Base
  validates_inclusion_of :on, :in => [true, false]
  validates :hue_number, presence: true
  belongs_to :bridge

  def turn_on_off
    self.on =  self.on ? false : true
  end
end
