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
        user = User.create(email: "TeSt@teSt.cOm",
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
    it "should show msg if password is only numbers" do
       user = User.create(email: "somethingnew@something.com",
                  first_name: "hi",
                  last_name: "bye",
                  password: "123",
                  password_confirmation: "123",
                  username: "username_test")
       expect(user.errors.full_messages).to include("Password must include a letter")
    end

    it "should show msg if non alpha/numeric symbols are present" do
       user = User.create(email: "somethingnew@something.com",
            first_name: "hi",
            last_name: "bye",
            password: "some123*",
            password_confirmation: "some123*",
            username: "username_test")
       expect(user.errors.full_messages).to include("Password must use alpha-numeric characters")
    end
  end
end
