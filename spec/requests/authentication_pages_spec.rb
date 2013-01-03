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
  		before { log_in user}

  		it { should have_selector('title', text: user.name)}
      it { should have_link('Users', href: users_path)}
  		it { should have_link('Profile', href: user_path(user))}
      it { should have_link('Settings', href: edit_user_path(user))}
  		it { should have_link('Log out', href: logout_path)}
  		it { should_not have_link('LOGIN', href: login_path)}

      
        describe "followed by logout" do
            before { click_link "Log out"}
            it{ should have_link("LOGIN")}
            it { should_not have_link("Log out")}
        end
  	end
  end


  describe "authorization" do

    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user)}
      let(:non_admin) { FactoryGirl.create(:user)}
      before { log_in non_admin}

      describe "submitting a DELETE request to the Users#destroy action" do
        before { delete user_path(user)}

        specify{ response.should redirect_to(root_path)}

      end
    end
    describe "for non-logged-in users" do
      let(:user) { FactoryGirl.create(:user)}

      describe "in the Users controller" do
        describe "visiting the edit page" do

          describe "when attempting to visit a protected page" do
            before do
              visit edit_user_path(user)
              fill_in "Email", with: user.email
              fill_in "Password", with: user.password
              click_button "Log In"
            end

            describe "after logging in," do
              it "should render the desired protected page" do
                page.should have_selector('title', text: "Edit user")
              end
            end
          end

         before { visit edit_user_path(user)}
         it { should have_selector('title', text: 'Log In')} 
        end

        describe " submitting to thte update action" do
          before { put user_path(user)}
          specify { response.should redirect_to(login_path)}
        end

        describe "visiting the user index" do
          before { visit users_path}
          it { should have_selector('title', text: "Log In")}

        end
      end
    end
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user)}
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com")}
      before { log_in user}

      describe "visiting Users#edit page of another user" do
        before { visit edit_user_path(wrong_user)}
        it { should have_selector('title', text: full_title(''))}
      end

      describe "submitting a PUT request to the Users#update action" do
        before { put user_path(wrong_user)}
        specify {response.should redirect_to(root_path)}
      end
    end 
  end

end
