require 'rails_helper'

RSpec.describe "Group", type: :feature do
  describe 'adding a new group' do
    before do
      User.create(username: 'Username', password: 'password', password_confirmation: 'password')
      visit(sign_in_path)
      fill_in 'username', with: 'Username'
      fill_in 'password', with: 'password'
      click_button 'Sign In'
    end

    scenario 'signed in user can create a new group.' do
      click_link("All groups")
      click_link("Create new group")
      fill_in 'group_name', with: 'sample'
      click_button 'Create Group'
      expect(page).to have_content 'Group Successfully added.'
    end
  end
end