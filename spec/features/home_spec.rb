require 'rails_helper'

RSpec.describe 'Home Page', type: :feature do
  it 'displays the name of the app' do
    visit(root_path)
    expect(page).to have_content('AutoFix')
  end
end