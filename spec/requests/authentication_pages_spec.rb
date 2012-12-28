require 'spec_helper'

describe "Authentication pages" do
	subject { page }

  describe "login" do
  	before { visit login_path}

  	it { should have_selector('h2', text: "Log In")}
  	it { should have_selector('title', text: "Log In")}

  	describe "with invalid information" do
  		before {click_button "Log In"}

  		it {should have_selector('title', text: "Log In")}
  		it { should have_selector('div.alert.alert-error', text: "Invalid")}

  		describe "after visiting another page" do
  			before {click_link "Home"}
  			it { should_not have_selector('div.alert.alert-error')}
  		end
  	end

  	describe "with valid information" do
  		let(:user) { FactoryGirl.create(:user)}
  		before do
  			fill_in "Email", 	with: user.email
  			fill_in "Password",	with: user.password
  			click_button "Log In"
  		end

  		it { should have_selector('title', text: user.name)}
  		it { should have_link('Profile', href: user_path(user))}
  		it { should have_link('Log out', href: logout_path)}
  		it { should_not have_link('LOGIN', href: login_path)}

      
        describe "followed by logout" do
            before { click_link "Log out"}
            it{ should have_link("LOGIN")}
            it { should_not have_link("Log out")}
        end
  	end
  end
end
