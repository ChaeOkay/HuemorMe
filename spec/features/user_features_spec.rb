require 'spec_helper'

feature User do

  context "signing up" do
    it "should display a success message" do
      visit root_path
      fill_in "user_first_name", with: "jimmy"
      fill_in "user_last_name", with: "wong"
      fill_in "user_username", with: "jws_lights"
      fill_in "user_email", with: "test@test.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_button "sign up"
      expect(page).to have_content("Welcome")
    end
  end

  context "user dashboard features" do
    let(:user) { build(:user) }
    let(:bridge) { FactoryGirl.build(:bridge, user: user) }
    let(:lamp) { FactoryGirl.build(:lamp, name: "lamp1") }
    before { @lamps = [lamp] }
    subject { @lamps }

    it "user should see all of their lamps" do
      assigns(:lamps, [lamp])
      current_user(user)
      visit user_path(user)
      #binding.pry
   #    expect(page.body).to include("lamp1")
   #  end
   # assign(:widgets, [
   #    stub_model(Widget, :name => "slicer"),
   #    stub_model(Widget, :name => "dicer")
   #  ])

      render

      rendered.should contain("lamp1")
      end


    it "clicking should change off button to on" do
      current_user(user)
      visit user_path(user)

      lamp.stub(:say_on_off) { "on" }
      #lamp.stub_chain(:say_on_off, :on?).and_return("off")
      lamp.stub(:on?) { false }


      #binding.pry
      click_button "Switch #{lamp.say_on_off}"
      # lamp.say_on_off.on?.should eq("off")
      #lamp.any_instance.stub(:on?).and_return( false )
      
      #click_button "Switch off"
      #expect(lamp.say_on_off).to eq("off")
      expect( page.find(:css, '#{lamp1}').text ).to eq "off"
    end
  end
end
      #subject.stub_chain(:one, :two, :three).and_return(:four)
      #subject.one.two.three.should eq(:four)
 