FactoryBot.define do
  factory :expenditure do
    name { "MyString" }
    amount { "9.99" }
    author_id { create(:user).id }
  end
end
