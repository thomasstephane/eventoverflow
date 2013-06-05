require 'spec_helper'

describe 'User' do 

  context 'signing up' do
    before { visit new_user_path }
    
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
    before { visit user_login_path }

    describe 'with invalid information' do
      it 'should not login the user' do
        click_button 'Login'
        expect(page).to have_content('Invalid')
      end
    end
  end



  
end