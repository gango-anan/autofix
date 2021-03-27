require 'rails_helper'

RSpec.describe 'Expenditure', type: :feature do
  describe 'adding a new expenditure.' do
    before do
      User.create(username: 'Username', password: 'password', password_confirmation: 'password')
      visit(sign_in_path)
      fill_in 'username', with: 'Username'
      fill_in 'password', with: 'password'
      click_button 'Sign In'
    end

    scenario 'signed in user can add a new expenditure.' do
      click_link('All my expenditures')
      click_link('Add new expenditure')
      fill_in 'expenditure_name', with: 'spender'
      fill_in 'expenditure_amount', with: 25
      click_button 'Add Expenditure'
      expect(page).to have_content 'Expenditure recorded.'
    end

    scenario 'user clicks on Expenditures link' do
      click_link('Expenditures')
      expect(page).to have_content 'ALL EXPENDITURES'
    end

    scenario 'user clicks on External expenditures link' do
      click_link('External expenditures')
      expect(page).to have_content 'My External Expenditures'
    end

    scenario 'user clicks on Groups link' do
      click_link('Groups')
      expect(page).to have_content 'All Groups'
    end

    scenario 'user clicks on Edit Password link' do
      click_link('Edit Password')
      expect(page).to have_content 'Edit Password'
    end

    scenario 'user clicks on Sign Out button' do
      click_button('Sign Out')
      expect(page).to have_content 'Successfully Signed Out.'
    end
  end
end
