require 'rails_helper'

RSpec.describe "User", type: :feature do
  describe 'signin process' do
    before(:all) do
      User.create(username: 'Username', password: 'password', password_confirmation: 'password')
    end

    it 'signs in a user successfully with correct credentials.' do
      visit(sign_in_path)
      fill_in 'username', with: 'Username'
      fill_in 'password', with: 'password'
      click_button 'Sign In'
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'does not sign in a user if the username is wrong.' do
      visit(sign_in_path)
      fill_in 'username', with: 'Username1'
      fill_in 'password', with: 'password'
      click_button 'Sign In'
      expect(page).to have_content 'Invalid Username or Password.'
    end

    it 'does not sign in a user if the password is wrong.' do
      visit(sign_in_path)
      fill_in 'username', with: 'username'
      fill_in 'password', with: 'password1'
      click_button 'Sign In'
      expect(page).to have_content 'Invalid Username or Password.'
    end
  end

  describe 'signup process' do
    it 'signs up a user successfully if all the data is correct.' do
      visit(new_user_path)
      within('form') do
        fill_in 'user_username', with: 'newuser'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
      end
      click_button 'Sign Up'
      expect(page).to have_content 'You are successfully signed Up.'
    end

    it 'does not signup a user if password and password_confirmation do not match.' do
      visit(new_user_path)
      within('form') do
        fill_in 'user_username', with: 'newuser'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password1'
      end
      click_button 'Sign Up'
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end
end