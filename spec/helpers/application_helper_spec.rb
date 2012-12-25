require 'spec_helper'

describe "Applicaton Helper" do 
	
	describe "full_title helper" do
		it "should include the page title" do
			full_title("foo").should =~ /foo/
		end

		it " should include the base title" do
			full_title("foo").should =~ /^Findle Network/
		end

		it "should not include a bar for the homepage" do
			full_title(" ").should_not =~ /\|/
		end
	end
end
