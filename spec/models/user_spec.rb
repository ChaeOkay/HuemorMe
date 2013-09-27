require 'spec_helper'

describe User do

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  context "with non-unique email" do
    let(:user) { build(:user) }
      it "should be invalid" do
      user2 = User.create(email: "test@test.com",
                  first_name: "hi",
                  last_name: "bye",
                  password: "test")
      expect(user2).to be_invalid
    end
  end
end
