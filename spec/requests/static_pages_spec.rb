require 'spec_helper'

describe "Static pages" do
	

  describe "home page" do
  	before { visit '/static_pages/home'}
    it "should have the right title and header" do
    	page.should have_selector('h1', text: 'Meet Findle')
    	page.should have_selector('title', text: 'Findle Network')
    end
  end

  describe "help page" do
  	before { visit '/static_pages/help'}
    it "should have the right title and header" do
    	page.should have_selector('h1', text: 'Help')
    	page.should have_selector('title', text: 'Findle Network')
    end
  end

  describe "about page" do
  	before { visit '/static_pages/about'}
    it "should have the right title and header" do
    	page.should have_selector('h1', text: 'About')
    	page.should have_selector('title', text: 'Findle Network')
    end
  end

  describe "contact page" do
  	before { visit '/static_pages/contact'}
    it "should have the right title and header" do
    	page.should have_selector('h1', text: 'Contact')
    	page.should have_selector('title', text: 'Findle Network')
    end
  end
end
