require 'spec_helper'

describe Bridge do
  it { should belong_to :user }
  it { should have_many :lamps }
  it { should respond_to :ip }
end