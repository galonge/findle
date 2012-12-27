require 'spec_helper'

describe "User pages" do
  
	subject { page }

  describe "signup" do
    	before { visit signup_path}
    	let(:submit) { "Create my account"}
    	
    	it { should have_selector('h2', text: "Sign up")}
    	it { should have_selector('title', text: "Sign up")}

    	describe "with invalid information" do
    		it "should not create a user" do
    			expect {click_button submit}.not_to change(User, :count)
    		end
    	end

    	describe "with valid information" do
    		before do
    			fill_in "Name",	 	with: "Example User"
    			fill_in "Email",	with: "user@example.com"
    			fill_in "Password",	with: "foobar"
    			fill_in "Confirm Password",	with: "foobar"
    		end

    		it "should create a user" do
    			expect {click_button submit}.to change(User, :count).by(1)
    		end
    	end
  end


  describe "profile page" do
  		#code to make a user variable
  		let(:user) { FactoryGirl.create(:user)}
  		before { visit user_path(user)}

  		it { should have_selector('h2', text: user.name)}
  		it { should have_selector('h2', text: user.name)}
  end
end