require 'spec_helper'

describe Bridge do
  it { should belong_to :user }
  it { should have_many :lamps }
  it { should respond_to :ip }
  it { should respond_to :device_id }
  it { should respond_to :lamps }

  it { should validate_uniqueness_of(:device_id).scoped_to(:user_id).with_message('can not register the same bridge twice') }
  it { should validate_presence_of(:ip) }
  it { should validate_presence_of(:device_id) }
end