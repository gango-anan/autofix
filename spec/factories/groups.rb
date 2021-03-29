FactoryBot.define do
  factory :group do
    name { 'MyString' }
    user_id { create(:user).id }
    expenditure_id { create(:expenditure, author_id: user_id) }
    icon { 'MyString' }
  end
end
