require 'spec_helper'

describe Bridge do
  it { should belong_to :user }
  it { should have_many :lamps }
end