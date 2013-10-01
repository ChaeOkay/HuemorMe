require 'spec_helper'

describe User do

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :username }

  let!(:user) { create(:user) }
  context "with non-unique email" do
    it "should be invalid" do
      expect{
        User.create(email: "TeSt@teSt.cOm",
                  first_name: "hi",
                  last_name: "bye",
                  password: "testing1",
                  password_confirmation: "testing1",
                  username: "username_test")
        }.to raise_error
    end
  end

  context "uppercase email" do
    it "should save as downcased" do
      expect(user.email).to eq "test@test.com"
    end
  end

  context "invalid password" do
    it "should raise error" do
      expect()
    end
  end
end
