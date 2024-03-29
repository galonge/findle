require 'spec_helper'

describe "Static pages" do
	subject { page }

  shared_examples_for "All static pages" do
    it { should have_selector('h2', text: heading)}
    it { should have_selector('title', text: full_title(page_title))}
  end

  describe "home page" do
  	before { visit root_path }
    	it { should have_selector('h3', text: 'Meet Findle')}
    	it { should have_selector('title', text: 'Findle Network')}
      it { should_not have_selector('title', text: '|Home')}
  end

  describe "help page" do
  	before { visit help_path}
    	let(:heading) {'Help'}
      let(:page_title) {'Help'}

      it_should_behave_like "All static pages"
  end

  describe "about page" do
  	before { visit about_path}
    	let(:heading) {'About'}
      let(:page_title) {'About'}

      it_should_behave_like "All static pages"
  end

  describe "contact page" do
  	before { visit contact_path}
    	let(:heading) {'Contact'}
      let(:page_title) {'Contact'}

      it_should_behave_like "All static pages"
  end

#links test
  it "should have the right link to the right pages" do

    visit root_path
    click_link "About"
    page.should have_selector('title', text: full_title('About'))
    click_link "Contact"
    page.should have_selector('title', text: full_title('Contact'))
    click_link('Help')
    page.should have_selector('title', text: full_title('Help'))
    click_link('Home')
    page.should have_selector('title', text: full_title(''))
    page.should_not have_selector('title', text: full_title('Home'))

  end



end
