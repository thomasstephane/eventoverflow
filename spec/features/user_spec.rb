require 'spec_helper'

describe 'User' do 

  context 'signing up' do
    before { visit root_path }
    
    describe 'with invalid information' do
      it 'should not create a user' do
        expect { click_button 'Signup' }.not_to change(User, :count)
      end
    end

    describe 'with valid information' do
      before do
        fill_in 'user_username', with: 'Example User'
        fill_in 'user_password', with: '1234'
        fill_in 'user_password_confirmation', with: '1234'
      end

      it 'should create a user' do
        expect { click_button 'Signup'}.to change(User, :count).by(1)
      end
    end
  end


  context 'logging in' do
    let(:user) { create(:user) }

    describe 'with invalid information' do
      it 'should not login the user' do
        visit root_path
        click_button 'Login'
        expect(page).to have_content('Invalid')
      end
    end

    describe 'with valid information' do
      before { visit root_path }
      it "does something cool" do
        fill_in 'username', with: user.username
        fill_in 'password', with: user.password
        click_button 'Login'

        expect(page).to have_content(user.username)
      end
    end 
  end

  context 'logging in with google' do
    before(:each) do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:default] = OmniAuth.config.mock_auth[:google]
    end

    it "can login with google" do
      visit root_path
      click_link 'Sign in with Google'
      page.current_path.should eq(user_path(User.last))
    end
  end
end