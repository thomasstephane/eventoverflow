require 'spec_helper'

describe 'User' do 

  context 'signup page' do
    it 'sees a signup form' do
      visit new_user_path
      page.has_content?('div#user-signup')
    end

    it 'throws an error if no username present' do
      visit new_user_path
      fill_in('password', with => 'test')
      fill_in('password_confirmation', with => 'test')
      click_button 'Signup'
      expect { raise} # no username
    end

    it 'throws an error if no password present' do
      visit new_user_path
      fill_in('username', with => 'test')
      click_button 'Signup'
      expect { raise} # no password
    end
  end


  # context 'login page' do
  #   it 'sees a login form' do
  #     visit
  #     page.has_content?('div#')
  # end



  
end