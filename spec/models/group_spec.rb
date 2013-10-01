require 'spec_helper'

describe Group do
  it { should validate_presence_of :name }
  it { should belong_to :user }
  it { should have_many :lamps }
end